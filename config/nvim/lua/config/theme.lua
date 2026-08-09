local M = {}

local theme_file = vim.fn.stdpath("state") .. "/theme"

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
end

function M.select_theme()
    local actions = require("fzf-lua.actions")
    require("fzf-lua").colorschemes({
        actions = {
            ["enter"] = function(selected)
                actions.colorscheme(selected)
                if selected and #selected > 0 then
                    local theme_name = selected[1]
                    M.save_theme(theme_name)
                end
            end,
        },
    })
end

return M
