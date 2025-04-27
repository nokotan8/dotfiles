return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd.with({
                    -- disabled_filetypes = { "svelte" },
                }),
                null_ls.builtins.formatting.rustywind,
                null_ls.builtins.formatting.sqruff,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.mdformat,
            },
        })
    end
}
