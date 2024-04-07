function SetColor()
    -- TODO: make config function for different themes
    -- e.g. everforest with darker bg, etc.
    -- color = color or "rose-pine"
    color = color or "everforest"
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
            -- vim.cmd("colorscheme rose-pine")
            -- SetColor()
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
            --vim.cmd("colorscheme vscode_modern")
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
                end,
            })
            everforest.load()
            vim.cmd("colorscheme everforest")
        end
    },
}
