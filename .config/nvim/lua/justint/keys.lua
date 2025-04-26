-- general
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", "<CMD>write<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
-- vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')

-- paste/delete to void
vim.keymap.set("x", "<leader>P", '\"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '\"_d')

-- buffer nav
vim.keymap.set('n', '<leader>[', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>]', ':bn<CR>', { noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")

local function tree()
    local node = vim.treesitter.get_node()
    local i = 0
    while true do
        print(node:type())
        if (node:type() ~= "code") then
            node = node:parent()
        else
            break
        end

        if i < 10 then
            break
        end
        i = i + 1
    end

    local start_row, start_col, end_row, end_col = node:range()

    vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col - 1 })
    vim.cmd('normal! v') -- start visual mode
    vim.api.nvim_win_set_cursor(0, { end_row + 1, end_col - 1 })
end


vim.keymap.set({ "n", "v" }, "<leader>o", tree, {})
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set('n', '<leader>k', [[:split | terminal
A]], { desc = "Exit terminal mode" })
