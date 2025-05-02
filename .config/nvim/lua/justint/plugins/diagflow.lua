return {
    "dgagn/diagflow.nvim",
    config = function()
        require('diagflow').setup({

            scope = "line"
        })
    end
}
