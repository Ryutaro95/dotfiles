local M = {}

local function switch_text_wrap(is_wrap)
    if is_wrap then
        vim.opt.wrap = true
    else
        vim.opt.wrap = false
    end
end

M.markdown = function()
    switch_text_wrap(true)
end

return setmetatable(M, {
    __index = function()
        return function()
            switch_text_wrap(false)
        end
    end
})
