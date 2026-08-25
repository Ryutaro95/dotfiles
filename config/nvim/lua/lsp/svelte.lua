return {
    cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
    root_markers = { "package.json", "svelte.config.js", "svelte.config.ts", "svelte.config.cjs", "svelte.config.mjs", ".git" },
    settings = {
        svelte = {
            plugin = {
                typescript = {
                    format = {
                        semicolons = "insert",
                    },
                },
                javascript = {
                    format = {
                        semicolons = "insert",
                    },
                },
            },
        },
        typescript = {
            format = {
                semicolons = "insert",
            },
        },
        javascript = {
            format = {
                semicolons = "insert",
            },
        },
        prettier = {
            semi = true,
        },
    },
}
