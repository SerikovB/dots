local M = {
  -- Plenary plugin
  "nvim-lua/plenary.nvim",

  -- Fkthemes
  {
    "flashcodes-themayankjha/fkthemes.nvim",
    dependencies = {
      {
        "folke/tokyonight.nvim",
        config = function()
          require("config.themes").tokyonight()
        end,
      },
      {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
          require("config.themes").catppuccin()
        end,
      },
      { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
    },
    config = function()
      require("config.themes").defaults()
    end,
  },

  -- Which key
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      return {}
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "config.gitsigns"
    end,
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.lualine").defaults()
    end,
  },

  -- BarBar
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.barbar").defaults()
    end,
  },

  -- Statuscol
  {
    "luukvbaal/statuscol.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
    },
    config = function()
      require("config.statuscol").defaults()
    end,
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("config.lspconfig").defaults()
    end,
  },

  -- Lazy
  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {},
  },

  -- Mason
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "config.mason"
    end,
  },

  -- Mason LSP config
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("config.lspconfig").mason()
    end,
  },

  -- CMP and snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          ---@diagnostic disable-next-line: different-requires
          require("config.luasnip").defaults()
        end,
      },
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "https://codeberg.org/FelipeLema/cmp-async-path.git",
      },
    },
    opts = function()
      return require "config.nvim-cmp"
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "config.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("config.telescope").defaults()
    end,
  },

  -- Nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("config.ntree").defaults()
    end,
  },
}

return M
