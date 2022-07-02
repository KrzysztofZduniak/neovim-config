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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- TODO
-- vim-sanegx (better file opening with gx)
-- lsp_signature
-- nvim-colorizer
-- vim-cursorword
-- wilder
-- twilight
-- neorg
-- yabs

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("akinsho/toggleterm.nvim")
	use("nvim-lualine/lualine.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("andweeb/presence.nvim")

	use("chentoast/marks.nvim")
	use("karb94/neoscroll.nvim")
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	use("tpope/vim-surround")
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")
	use({ "turbio/bracey.vim", run = "npm install --prefix server" })
	-- use("nvim-orgmode/orgmode")

	-- use("sunjon/shade.nvim")
	use("folke/todo-comments.nvim")
	-- use("gbprod/substitute.nvim")
	-- use("pocco81/truezen.nvim")

	-- ------- Colorschemes -----------
	-- use("lunarvim/Colorschemes")
	use("RRethy/nvim-base16")

	-- ------- LSP --------------
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim")
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	})
	use("simrat39/symbols-outline.nvim")
	-- use("ray-x/lsp_signature.nvim")

	-- -------- debugger ------------
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

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
	use("timonv/vim-cargo")
	use("simrat39/rust-tools.nvim")

  -- -------- Telescope -----------
  use({
  	"nvim-telescope/telescope.nvim",
  	requires = { { "nvim-lua/plenary.nvim" } },
  })
  use("nvim-telescope/telescope-ui-select.nvim")

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
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")

	-- --------- Latex ------------------
	use("lervag/vimtex")

	-- ---------- Notes ---------------
	-- use("jbyuki/nabla.nvim")
	-- use("jbyuki/venn.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
