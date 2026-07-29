local M = {}

local theme_file = vim.fn.stdpath("state") .. "/theme"

local function apply_transparent_hl()
    local theme = vim.g.colors_name
    if theme and theme:find("gruvbox") then
        return
    end
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#6d7682", bg = "NONE" })
end

function M.save_theme(name)
    local f = io.open(theme_file, "w")
    if f then
        f:write(name)
        f:close()
    end
end

function M.get_saved_theme()
    local f = io.open(theme_file, "r")
    if f then
        local name = f:read("*all"):gsub("%s+", "")
        f:close()
        if name ~= "" then
            return name
        end
    end
    return "jb"
end

function M.apply_saved_theme()
    local theme = M.get_saved_theme()
    pcall(vim.cmd.colorscheme, theme)
    apply_transparent_hl()
end

function M.select_theme()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").colorschemes({
        actions = {
            ["enter"] = function(selected)
                actions.colorscheme(selected)
                apply_transparent_hl()
                if selected and #selected > 0 then
                    local theme_name = selected[1]
                    M.save_theme(theme_name)
                end
            end,
        },
    })
end

return M
