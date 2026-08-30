-- treesitterハイライト有効化
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- 2スペースインデント設定
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "svelte",
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        "yaml",
        "lua",
        "nix",
    },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- Svelte用スマートインデント
local function svelte_indent()
    local lnum = vim.v.lnum
    if lnum <= 1 then
        return 0
    end

    local sw = vim.fn.shiftwidth()
    local prev_lnum = vim.fn.prevnonblank(lnum - 1)
    if prev_lnum == 0 then
        return 0
    end

    local prev_line = vim.fn.getline(prev_lnum)
    local cur_line = vim.fn.getline(lnum)
    local prev_indent = vim.fn.indent(prev_lnum)

    local indent = prev_indent

    -- 1. 前の行でブロックが開かれた場合 (+shiftwidth)
    if prev_line:match("[{%(%[]%s*$") or prev_line:match("[{%(%[]%s*//.*$") or prev_line:match("[{%(%[]%s*/%*.*%*/%s*$") then
        indent = indent + sw
    elseif prev_line:match("{%s*#[%w_]+.-}%s*$") or prev_line:match("{%s*:[%w_]+.-}%s*$") then
        indent = indent + sw
    elseif prev_line:match("<[a-zA-Z0-9_-]+[^>]-[^/%?]?>%s*$") and not prev_line:match("</") and not prev_line:match("/>%s*$") then
        local tag = prev_line:match("<([a-zA-Z0-9_-]+)")
        local void_tags = {
            area = 1, base = 1, br = 1, col = 1, embed = 1, hr = 1, img = 1, input = 1, link = 1, meta = 1, param = 1, source = 1, track = 1, wbr = 1
        }
        if tag and not void_tags[tag:lower()] then
            indent = indent + sw
        end
    end

    -- 2. 現在の行でブロックが閉じられる場合 (-shiftwidth)
    if cur_line:match("^%s*[%}%]%)]") then
        indent = indent - sw
    elseif cur_line:match("^%s*{%s*/[%w_]+.-}") or cur_line:match("^%s*{%s*:[%w_]+.-}") then
        indent = indent - sw
    elseif cur_line:match("^%s*</[a-zA-Z0-9_-]+>") then
        indent = indent - sw
    end

    return math.max(0, indent)
end

_G.svelte_indent = svelte_indent

vim.api.nvim_create_autocmd("FileType", {
    pattern = "svelte",
    callback = function()
        vim.opt_local.indentexpr = "v:lua.svelte_indent()"
    end,
})

-- quickfixの背景をエディタより暗くする(カラースキーム変更のたびに追従)
local function darken_hex(hex, amount)
    local r = tonumber(hex:sub(2, 3), 16)
    local g = tonumber(hex:sub(4, 5), 16)
    local b = tonumber(hex:sub(6, 7), 16)
    r = math.max(0, math.floor(r * (1 - amount)))
    g = math.max(0, math.floor(g * (1 - amount)))
    b = math.max(0, math.floor(b * (1 - amount)))
    return string.format("#%02x%02x%02x", r, g, b)
end

local function set_qf_highlight()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
    if not normal.bg then
        return
    end
    local dark_bg = darken_hex(string.format("#%06x", normal.bg), 0.2)
    vim.api.nvim_set_hl(0, "QfNormal", { bg = dark_bg, fg = normal.fg })

    -- カーソル行をエディタより暗くする(デフォルトは明るくなるテーマが多いため)
    local cursorline_bg = darken_hex(string.format("#%06x", normal.bg), 0.2)
    vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline_bg })

    -- 対応括弧も明るくするのではなく暗くし、文字色はパステルな赤ピンクで見やすくする
    local matchparen_bg = darken_hex(string.format("#%06x", normal.bg), 0.3)
    vim.api.nvim_set_hl(0, "MatchParen", { bg = matchparen_bg, fg = "#e57373", bold = true })

    -- xrefピッカー(gr)用のハイライト。カラースキーム変更のたびに張り直す。
    vim.api.nvim_set_hl(0, "XrefFile", { link = "Title", italic = true, default = false })
    vim.api.nvim_set_hl(0, "XrefLnum", { link = "Number", default = false })
    vim.api.nvim_set_hl(0, "XrefMatch", { link = "Identifier", bold = true, default = false })
end

set_qf_highlight()
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_qf_highlight,
})

-- quickfixリストの選択移動に合わせて、フォーカスは保ったままエディタ側もその場所へ移動する
-- <CR>で確定してリストを閉じる / <Esc>でキャンセルして元の位置に戻す
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function(args)
        vim.wo.winhighlight = "Normal:QfNormal,NormalNC:QfNormal,SignColumn:QfNormal,EndOfBuffer:QfNormal"

        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = args.buf,
            callback = function()
                local qf_win = vim.api.nvim_get_current_win()
                local idx = vim.fn.line(".")
                local ok = pcall(vim.cmd, "noautocmd " .. idx .. "cc")
                if ok and vim.api.nvim_win_is_valid(qf_win) then
                    vim.api.nvim_set_current_win(qf_win)
                end
            end,
        })

        vim.keymap.set("n", "<CR>", function()
            vim.cmd("cc")
            vim.cmd("cclose")
        end, { buffer = args.buf, silent = true })

        vim.keymap.set("n", "<Esc>", function()
            local origin_win = vim.b[args.buf].qf_origin_win
            local origin_pos = vim.b[args.buf].qf_origin_pos
            vim.cmd("cclose")
            if origin_win and vim.api.nvim_win_is_valid(origin_win) then
                vim.api.nvim_set_current_win(origin_win)
                if origin_pos then
                    pcall(vim.api.nvim_win_set_cursor, origin_win, origin_pos)
                end
            end
        end, { buffer = args.buf, silent = true, nowait = true })
    end,
})

-- 保存時に自動format (go)
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
        })
        vim.lsp.buf.format({ async = false })
    end,
})

