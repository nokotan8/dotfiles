-- general
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":wa<CR>", { silent = true })


-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')
-- vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')

-- paste/delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", '\"_d')
-- vim.keymap.set("x", "<leader>P", '\"_dP')

-- buffer nav
-- vim.keymap.set('n', '<leader>[', ':bp<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>]', ':bn<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move lines
-- I basically never use this
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- Function to replace "vector|string" with "std::vector|string" and add the #include
-- For leetcode LMAO
function CppAddStd()
    local found1 = false
    local found2 = false;
    local line_count = vim.api.nvim_buf_line_count(0)

    for i = 0, line_count - 1 do
        local line = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1]
        if string.find(line, "vector") then
            found1 = true
            local new_line = string.gsub(line, "vector", "std::vector")
            vim.api.nvim_buf_set_lines(0, i, i + 1, false, { new_line })
        end
        if string.find(line, "string") then
            found2 = true
            local new_line = string.gsub(line, "string", "std::string")
            vim.api.nvim_buf_set_lines(0, i, i + 1, false, { new_line })
        end
    end

    if found1 then
        local lines = vim.api.nvim_buf_get_lines(0, 0, 1, false)
        if lines[1] ~= "#include <vector>" then
            vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#include <vector>" })
        end
    end
    if found2 then
        local lines = vim.api.nvim_buf_get_lines(0, 0, 1, false)
        if lines[1] ~= "#include <string>" then
            vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#include <string>" })
        end
    end
end

vim.keymap.set("n", "<leader>lc", CppAddStd, { noremap = true, silent = true })

-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
-- vim.keymap.set('n', '<leader>k', [[:split | terminal
-- A]], { desc = "Exit terminal mode" })
