return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { 'nvim-telescope/telescope-ui-select.nvim', "nvim-lua/plenary.nvim", { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
        require('telescope').setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }
        })
        local builtin = require('telescope.builtin')
        local action_state = require('telescope.actions.state')
        vim.keymap.set('n', '<leader>f', builtin.find_files, { silent = true })
        vim.keymap.set('n', '<leader>F', function()
            builtin.find_files({ hidden = true })
        end, { silent = true })
        vim.keymap.set("n", "<leader>g", builtin.live_grep, { silent = true })
        vim.keymap.set("n", "<leader>r", ":Telescope oldfiles<CR>", { silent = true })
        vim.keymap.set('n', '<leader>H', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>co', builtin.colorscheme, { desc = 'Change colorscheme' })
        vim.keymap.set('n', '<leader>lt', builtin.treesitter, { desc = 'List functions' })
        vim.keymap.set('n', '<leader>lq', '<cmd>Telescope diagnostics<CR>')
        vim.keymap.set('n', '<leader>b', function()
            builtin.buffers({
                initial_mode = "normal",
                attach_mappings = function(prompt_bufnr, map)
                    local delete_buf = function()
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        current_picker:delete_selection(function(selection)
                            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                        end)
                    end

                    map('n', '<leader>d', delete_buf) -- delete buffer with <leader>b

                    return true
                end
            })
        end)

        require('telescope').load_extension('fzf')
        require("telescope").load_extension("ui-select")
    end

}
