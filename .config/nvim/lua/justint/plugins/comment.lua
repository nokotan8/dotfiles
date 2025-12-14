return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require("Comment").setup({
            toggler = {
                line = '<C-l>',
                block = 'gbc'
            },

            opleader = {
                line = '<C-l>',
                block = 'gb'
            },

            mappings = {
                basic = true,
                extra = true
            }
        })
    end
}
