return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    config = function()
       local highlight = {
        "CursorColumn", "Whitespace",
        }
        require("ibl").setup {
            -- buftype_exclude = { "terminal", "nowrite", "help" },
            indent = {
                char = "•",
                -- highlight = highlight,
            },
            whitespace = {
            --     highlight = highlight,
                remove_blankline_trail = false,
            },
            -- scope = { enabled = false },
        }
    end
  },
}
