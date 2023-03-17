return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  "nvim-lualine/lualine.nvim",
  --[[ "lewis6991/impatient.nvim", ]]
  "folke/which-key.nvim",
  "godlygeek/tabular",
  --[[ "chrisbra/Colorizer", ]]
  "rcarriga/nvim-notify",
  "nvim-treesitter/playground",
  {
    "folke/noice.nvim",
    event = "VimEnter",
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          command_palette = true,
          long_message_to_split = true, -- long messages will be sent to a split
        },
        routes = {
          {
            view = "mini",
            filter = { event = "msg_show", find = "written$" },
            opts = {},
          },
        },
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    dependencies = "antoinemadec/FixCursorHold.nvim",
    config = function()
      vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({ easing_function = "cubic" })
    end,
  },
  {
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  }, --[[ ("tpope/vim-sleuth") ]]
  "tpope/vim-surround",
  "tpope/vim-repeat",
  -- ------- Colorschemes -----------
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        keywordStyle = { bold = false },
        statementStyle = { bold = false },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local border = { fg = colors.palette.carpYellow, bg = colors.palette.dragonBlack2 }
          return {
            WinSeparator = border,
            Normal = border,
            NormalFloat = border,
            FloatBorder = border,
            TelescopeBorder = border,
            Todo = { fg = colors.palette.dragonBlack0, bg = colors.palette.carpYellow },
          }
        end,
        theme = "dragon",
      })
    end,
  },
  "lunarvim/Colorschemes",
  "RRethy/nvim-base16",
  -- ------- LSP --------------
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jose-elias-alvarez/typescript.nvim",
  -- ------- cmp plugins ------------
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",
  -- -------- snippets -------------
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
  },

  -- -------- Rust --------------
  "timonv/vim-cargo",
  "simrat39/rust-tools.nvim",
  -- -------- Telescope -----------
  { "nvim-telescope/telescope.nvim",   name = "telescope", dependencies = { "nvim-lua/plenary.nvim" } },

  {
    "keyvchan/telescope-find-pickers.nvim",
    config = function()
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "adoyle-h/lsp-toggle.nvim",
    config = function()
      require("lsp-toggle").setup({ telescope = true })
    end,
  },
  "nvim-telescope/telescope-ui-select.nvim",
  "benfowler/telescope-luasnip.nvim",
  -- -------- TreeSitter ----------
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "JoosepAlviste/nvim-ts-context-commentstring",
  -- --------- git ---------------
  "lewis6991/gitsigns.nvim",
  -- --------- nvim tree --------------
  "kyazdani42/nvim-web-devicons",
  --[[ ("kyazdani42/nvim-tree.lua") ]]
  -- --------- bufferline -------------
  --[[ ("akinsho/bufferline.nvim") ]]
  "moll/vim-bbye",
  -- --------- Latex ------------------
  "lervag/vimtex",

  -- 	"rmagatti/goto-preview",
  -- ("ray-x/lsp_signature.nvim")
}
