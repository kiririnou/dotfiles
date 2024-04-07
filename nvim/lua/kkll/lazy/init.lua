return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            vim.notify = require("notify")
        end
    }
}
