return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    -- ft = "markdown",
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/Documents/data-vault/*.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/Documents/data-vault/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "main",
                path = "~/Documents/data-vault",
            },
        },
        ui = {
            enable = false,
        },
        wiki_link_func = "use_path_only",
        -- completion = {
        --     nvim_cmp = true,
        --     min_char = 2,
        -- },
        -- note_id_func = function(title)
            -- Testing to use my way with just title with no timestamp
            -- might change later
            -- -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- -- In this case a note with the title 'My new note' will be given an ID that looks
            -- -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            -- local suffix = ""
            -- if title ~= nil then
            --     -- If title is given, transform it into valid file name.
            --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            -- else
            --     -- If title is nil, just add 4 random uppercase letters to the suffix.
            --     for _ = 1, 4 do
            --         suffix = suffix .. string.char(math.random(65, 90))
            --     end
            -- end
            -- return tostring(os.time()) .. "-" .. suffix
            --
            -- TODO: how to make it work?
            -- local suffix = ""
            -- if title ~= nil then
            --     -- If title is given, transform it into valid file name.
            --     -- suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            -- else
            --     -- If title is nil, just add 4 random uppercase letters to the suffix.
            --     for _ = 1, 4 do
            --         suffix = suffix .. string.char(math.random(65, 90))
            --     end
            -- end
            -- return title .. suffix
        -- end,
    },
}
