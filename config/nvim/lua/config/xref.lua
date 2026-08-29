-- Doom Emacsのxrefバッファ風の参照/定義一覧ピッカー。
-- ネイティブのquickfixウィンドウは1エントリ=1行の制約があり
-- ファイル名ヘッダーでのグルーピング表示ができないため、専用バッファを組み立てる。
local M = {}

local ns = vim.api.nvim_create_namespace("xref_picker")

local function relpath(filename)
    local ok, rel = pcall(vim.fn.fnamemodify, filename, ":.")
    return ok and rel or filename
end

local function trim(text)
    return (text or ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("\n", " ")
end

function M.show(opts)
    local items = opts.items or {}
    if #items == 0 then
        vim.notify("No results", vim.log.levels.INFO)
        return
    end

    local origin_win = opts.origin_win
    local origin_buf = vim.api.nvim_win_get_buf(origin_win)
    local origin_pos = vim.api.nvim_win_get_cursor(origin_win)
    local symbol = opts.symbol or ""
    local label = opts.label or "Go to xref"

    vim.fn.setqflist({}, " ", { items = items, title = label })

    local lines = { "" }
    local line_qidx = {}
    local is_header = {}
    local last_file = nil
    local qidx = 0

    for _, item in ipairs(items) do
        qidx = qidx + 1
        local file = relpath(item.filename or "")
        if file ~= last_file then
            table.insert(lines, "  " .. file)
            is_header[#lines] = true
            last_file = file
        end
        table.insert(lines, string.format("%6d  %s", item.lnum or 0, trim(item.text)))
        line_qidx[#lines] = qidx
    end
    local total = qidx

    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].swapfile = false
    vim.bo[buf].filetype = "xrefpicker"
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local height = math.floor(vim.o.lines * 1 / 3)
    vim.cmd(height .. "split")
    vim.cmd("wincmd J")
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.wo[win].signcolumn = "no"
    vim.wo[win].wrap = false
    vim.wo[win].cursorline = true
    vim.wo[win].winfixheight = true
    vim.wo[win].list = false
    vim.wo[win].fillchars = "eob: "
    vim.api.nvim_win_set_height(win, height)
    vim.wo[win].winhighlight = "Normal:QfNormal,NormalNC:QfNormal,EndOfBuffer:QfNormal"

    local function render_prompt(idx)
        vim.bo[buf].modifiable = true
        vim.api.nvim_buf_set_lines(buf, 0, 1, false, {
            string.format("%d/%d  %s: %s", idx, total, label, symbol),
        })
        vim.bo[buf].modifiable = false
    end

    for i, line in ipairs(lines) do
        if is_header[i] then
            vim.api.nvim_buf_add_highlight(buf, ns, "XrefFile", i - 1, 0, -1)
        elseif line_qidx[i] then
            local _, numend = line:find("^%s*%d+")
            vim.api.nvim_buf_add_highlight(buf, ns, "XrefLnum", i - 1, 0, numend or 0)
            if symbol ~= "" then
                local s, e = line:find(symbol, (numend or 0) + 1, true)
                while s do
                    vim.api.nvim_buf_add_highlight(buf, ns, "XrefMatch", i - 1, s - 1, e)
                    s, e = line:find(symbol, e + 1, true)
                end
            end
        end
    end

    local function nearest_item_line(lnum)
        for i = lnum, #lines do
            if line_qidx[i] then
                return i
            end
        end
        for i = lnum, 1, -1 do
            if line_qidx[i] then
                return i
            end
        end
        return 2
    end

    local function preview(qi)
        vim.api.nvim_win_call(origin_win, function()
            pcall(vim.cmd, "noautocmd " .. qi .. "cc")
        end)
    end

    render_prompt(1)
    vim.bo[buf].modifiable = false
    vim.api.nvim_win_set_cursor(win, { nearest_item_line(2), 0 })
    preview(1)

    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = buf,
        callback = function()
            local lnum = vim.api.nvim_win_get_cursor(win)[1]
            local target = nearest_item_line(lnum)
            if target ~= lnum then
                vim.api.nvim_win_set_cursor(win, { target, 0 })
            end
            local qi = line_qidx[target]
            if qi then
                render_prompt(qi)
                preview(qi)
            end
        end,
    })

    local function close()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end

    local function confirm()
        local lnum = vim.api.nvim_win_get_cursor(win)[1]
        local qi = line_qidx[nearest_item_line(lnum)]
        close()
        if qi and vim.api.nvim_win_is_valid(origin_win) then
            vim.api.nvim_win_call(origin_win, function()
                pcall(vim.cmd, qi .. "cc")
            end)
            vim.api.nvim_set_current_win(origin_win)
        end
    end

    local function cancel()
        close()
        if vim.api.nvim_win_is_valid(origin_win) then
            vim.api.nvim_win_set_buf(origin_win, origin_buf)
            vim.api.nvim_win_set_cursor(origin_win, origin_pos)
            vim.api.nvim_set_current_win(origin_win)
        end
    end

    local map_opts = { buffer = buf, silent = true, nowait = true }
    vim.keymap.set("n", "<CR>", confirm, map_opts)
    vim.keymap.set("n", "<Esc>", cancel, map_opts)
    vim.keymap.set("n", "q", cancel, map_opts)
end

return M
