require "justint.opts"
require "justint.keys"
require "justint.lazy"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.cl",
    command = "set filetype=c"
})
