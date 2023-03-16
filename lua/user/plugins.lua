return {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"nvim-lualine/lualine.nvim",
	--[[ "lewis6991/impatient.nvim", ]]
	"lukas-reineke/indent-blankline.nvim",
	"folke/which-key.nvim",
	"godlygeek/tabular",
	"chrisbra/Colorizer",
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
				presets = { command_palette = true },
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
		"Everblush/everblush.nvim",
		as = "everblush",
		config = function()
			local colors = {
				color0 = "#232a2d",
				color1 = "#e57474",
				color2 = "#8ccf7e",
				color3 = "#e5c76b",
				color4 = "#67b0e8",
				color5 = "#c47fd5",
				color6 = "#6cbfbf",
				color7 = "#b3b9b8",
				color8 = "#2d3437",
				color9 = "#ef7e7e",
				color10 = "#96d988",
				color11 = "#f4d67a",
				color12 = "#71baf2",
				color13 = "#ce89df",
				color14 = "#67cbe7",
				color15 = "#bdc3c2",
				comment = "#404749",
				contrast = "#161d1f",
				background = "#141b1e",
				foreground = "#dadada",
				cursorline = "#2c3333",
				none = "NONE",
			}

			local border = { fg = colors.color2 }
			require("everblush").setup({
				override = {
					FloatBoarder = border,
					WinSeparator = border,
					WhichKeyBorder = border,
					LspInfoBorder = border,
					LspFloatWinBorder = border,
					NullLsInfoBorder = border,
					TelescopeBorder = border,
					TelescopeSelection = { fg = colors.background, bg = colors.color8 },
				},
			})
		end,
	},
	"lunarvim/Colorschemes",
	"RRethy/nvim-base16",
	{ dir = "~/repos/nvim_plugins/oxocarbon.nvim" },
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
	--[[ "L3MON4D3/LuaSnip", ]]
	-- -------- Rust --------------
	"timonv/vim-cargo",
	"simrat39/rust-tools.nvim",
	-- -------- Telescope -----------
	{ "nvim-telescope/telescope.nvim", name = "telescope", dependencies = { "nvim-lua/plenary.nvim" } },

	{
		"keyvchan/telescope-find-pickers.nvim",
		config = function() end,
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
