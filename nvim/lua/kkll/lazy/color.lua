Color = "gruvbox-material"

function SetColor(newColor)
    local color = newColor or Color or "cyberdream"
    vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({})
        end
    },
    {
        "gmr458/vscode_modern_theme.nvim",
        name = "vscode_modern",
        config = function ()
            require("vscode_modern").setup({
                cursorline = true,
                transparent_background = false,
                nvim_tree_darker = true,
            })
        end
    },
    {
        "neanias/everforest-nvim",
        name = "everforest",
        version = false,
        config = function()
            local everforest = require("everforest")
            everforest.setup({
                background = "hard",
                italics = true,
                disable_italic_comments = false,
                colours_override = function(palette)
                    palette.bg0 = "#1e2326"
                    -- palette.bg0 = "#000000"
                end,
            })
            -- everforest.load()
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        name = "cyberdream",
        config = function ()
            require("cyberdream").setup({})
        end
    },
    {
        "maxmx03/fluoromachine.nvim",
        name = "fluoromachine",
        config = function ()
            local fm = require("fluoromachine")
            fm.setup {
                glow = true,
                theme = "delta",
                transparent = false,
            }
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function ()
            require("gruvbox").setup({})
        end
    },
    {
        "sainnhe/gruvbox-material",
        name = "gruvbox-mat",
        config = function ()
            -- require("gruvbox-material").setup({})
            SetColor()
        end
    },
}
