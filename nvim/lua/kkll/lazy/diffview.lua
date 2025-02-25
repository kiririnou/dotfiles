return {
    "sindrets/diffview.nvim",
    config = function()
        require('diffview').setup({
            use_icons = false,
            merge_tool = {
                layout = "diff3_mixed",
            },
        })
    end
}
