require("nvim-ts-autotag").setup({
    opts = {
        enable_close = true,          -- Auto close tags (e.g. <li> -> <li></li>)
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
    },
    aliases = {
        ["svelte"] = "html",
    },
})
