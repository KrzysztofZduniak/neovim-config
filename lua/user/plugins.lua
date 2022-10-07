local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("nvim-lualine/lualine.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/which-key.nvim")
	use("andweeb/presence.nvim")
	use("godlygeek/tabular")

	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	use({
		"rcarriga/nvim-notify",
		setup = function()
			require("notify").setup({
				max_width = 50,
				top_down = true,
				stages = "slide",
				minimum_width = 30,
			})
		end,
	})

	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
		config = function()
			vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				easing_function = "cubic",
			})
		end,
	})

	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	use("tpope/vim-surround")
	use("tpope/vim-repeat")

	-- ------- Colorschemes -----------
	-- use("lunarvim/Colorschemes")
	use("RRethy/nvim-base16")

	-- ------- LSP --------------
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	--[[ use("folke/trouble.nvim") ]]
	use("~/projects/trouble.nvim")
	use("jose-elias-alvarez/typescript.nvim")

	-- ------- cmp plugins ------------
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- -------- snippets -------------
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- -------- Rust --------------
	-- use("timonv/vim-cargo")
	use("simrat39/rust-tools.nvim")

	-- -------- Telescope -----------
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-packer.nvim")
	use("linarcx/telescope-changes.nvim")

	-- -------- TreeSitter ----------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- --------- git ---------------
	use("lewis6991/gitsigns.nvim")

	-- --------- nvim tree --------------
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- --------- bufferline -------------
	--[[ use("akinsho/bufferline.nvim") ]]
	use("moll/vim-bbye")

	-- --------- Latex ------------------
	use("lervag/vimtex")

	-- ---------- Notes ---------------
	-- use("jbyuki/nabla.nvim")
	-- use("jbyuki/venn.nvim")
	--
	-- use({
	-- 	"rmagatti/goto-preview",
	-- 	config = function()
	-- 		require("goto-preview").setup({})
	-- 	end,
	-- })
	-- use("simrat39/symbols-outline.nvim")
	-- use("ray-x/lsp_signature.nvim")
	-- use({
	-- 	"rmagatti/goto-preview",
	-- 	config = function()
	-- 		require("goto-preview").setup({})
	-- 	end,
	-- })
	-- use("simrat39/symbols-outline.nvim")
	-- use("ray-x/lsp_signature.nvim")
	-- use("akinsho/toggleterm.nvim")
	-- use("goolord/alpha-nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
