return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            }

        })
        vim.keymap.set({ "n", "x" }, "<leader>o", function() require("oil").open() end, { silent = true })
    end
}
