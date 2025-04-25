return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require("Comment").setup({
            toggler = {
                line = '<C-/>',
                block = 'gbc'
            },

            opleader = {
                line = '<C-/>',
                block = 'gb'
            },

            mappings = {
                basic = true,
                extra = true
            }
        })
    end
}
