return {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"nvim-lualine/lualine.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"folke/which-key.nvim",
	"godlygeek/tabular",
	"chrisbra/Colorizer",
	"rcarriga/nvim-notify",
	-- { "folke/noice.nvim", event = "VimEnter", config = function() require("noice").setup({ lsp = { override = { ["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true, ["cmp.entry.get_documentation"] = true, }, }, presets = { command_palette = true, }, }) end, dependencies = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", }, },
	-- { "kosayoda/nvim-lightbulb", requires = "antoinemadec/FixCursorHold.nvim", config = function() vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]) end, },
	-- { "karb94/neoscroll.nvim", config = function() require("neoscroll").setup({ easing_function = "cubic", }) end, },
	-- { "luukvbaal/stabilize.nvim", config = function() require("stabilize").setup() end, }, --[[ ("tpope/vim-sleuth") ]]
	"tpope/vim-surround",
	"tpope/vim-repeat",
	-- ------- Colorschemes -----------
	-- ("lunarvim/Colorschemes")
	"RRethy/nvim-base16",
	--{ dir = "~/repos/nvim_plugins/oxocarbon.nvim" },
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
	-- -------- snippets -------------
	"L3MON4D3/LuaSnip",
	-- -------- Rust --------------
	-- ("timonv/vim-cargo")
	"simrat39/rust-tools.nvim",
	-- -------- Telescope -----------
	-- { "nvim-telescope/telescope.nvim", dependencies = { { "nvim-lua/plenary.nvim" } }, },
	
	--{ "keyvchan/telescope-find-pickers.nvim", config = function() vim.keymap.set("n", "<leader><leader>", require("telescope").extensions.find_pickers.find_pickers) end, },
	-- { "adoyle-h/lsp-toggle.nvim", config = function() require("lsp-toggle").setup({ telescope = true, }) end, },
	"nvim-telescope/telescope-ui-select.nvim",
	"benfowler/telescope-luasnip.nvim",
	-- -------- TreeSitter ----------
	"nvim-treesitter/nvim-treesitter",
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
