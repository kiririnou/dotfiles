vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "kkll.lazy",
    change_detection = { notify = false }
})
--[[
require("lazy").setup({
  --{ "nvim-telescope/telescope.nvim", tag = "0.1.4",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim"
  --  },
  --  lazy = false
  --},
  --{ "rose-pine/neovim", name = "rose-pine", lazy = false },

  --{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false },
  --"nvim-treesitter/playground",
  --{ "ThePrimeagen/harpoon", lazy = false },
  --{ "mbbill/undotree", lazy = false },
  --{ "tpope/vim-fugitive", lazy = false },

  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "neovim/nvim-lspconfig",

      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip"
    },
    lazy = false
  },

  { "numToStr/Comment.nvim" },
  { "rcarriga/nvim-notify", lazy = false }
})
--]]
