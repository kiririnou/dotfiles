return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 120,
                    options = {}
                },
                -- plugins = {
                --     options = {
                --         laststatus = 3,
                --     },
                -- },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            SetColor()
        end)

        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup {
                window = {
                    width = 100,
                    options = {}
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            SetColor()
        end)

        vim.keymap.set("n", "<leader>ZZ", function()
            require("zen-mode").setup {
                window = {
                    width = 80,
                    options = {}
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
            SetColor()
        end)
    end
}

