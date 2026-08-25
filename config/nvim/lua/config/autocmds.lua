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

