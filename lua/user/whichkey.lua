local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- show s a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	b = {
		":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<cr>",
		"Buffers",
	},
	e = { ":NvimTreeToggle<cr>", "File Explorer" },
	w = { ":w<CR>", "Save" },
	q = { ":qa<CR>", "Quit" },
	c = { ":Bdelete!<CR>", "Close Buffer" },
	h = { ":nohlsearch<CR>", "No Highlight" },
	f = { ":Telescope find_files<cr>", "Find files" },
	F = { ":Telescope live_grep theme=ivy<cr>", "Find Text" },

	p = {
		name = "Packer",
		c = { ":PackerCompile<cr>", "Compile" },
		i = { ":PackerInstall<cr>", "Install" },
		s = { ":PackerSync<cr>", "Sync" },
		S = { ":PackerStatus<cr>", "Status" },
		u = { ":PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { ":lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { ":lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { ":lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { ":Telescope git_status<cr>", "Open changed file" },
		b = {
			":Telescope git_branches theme=dropdown<cr>",
			"Checkout branch",
		},
		c = { ":Telescope git_commits<cr>", "Checkout commit" },
		d = { ":Telescope git_bcommits theme=ivy<cr>", "Diff" },
	},

	l = {
		name = "LSP",
		d = { ":Telescope diagnostics theme=dropdown<cr>", "Document Diagnostics" },
		f = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { ":LspInfo<cr>", "Info" },
		I = { ":LspInstallInfo<cr>", "Installer Info" },
		j = { ":lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { ":lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		t = { ":TroubleToggle<cr>", "Trouble" },
		-- l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },

		-- TroubleToggle is better
		-- q = { ":lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { ":Telescope treesitter<cr>", "Document Symbols" },
	},

	r = {
		name = "Rust",
		a = { ":RustCodeAction<cr>", "Code actions" },
		r = { ":lua require'rust-tools.runnables'.runnables()<cr>", "Runnables" },
		d = { ":lua require'rust-tools.debuggables'.debuggables()<cr>", "Debuggables" },
		i = { ":lua require'rust-tools.inlay_hints'.toggle_inlay_hints()<cr>", "Inlay hints" },
		h = { ":lua require'rust-tools.hover_actions'.hover_actions()<cr>", "Hover actions" },
		c = { ":lua require'rust-tools.open_cargo_toml'.open_cargo_toml()<cr>", "Cargo toml" },
		j = { ":lua require'rust-tools.join_lines'.join_lines()<cr>", "Join lines" },
		-- s = { ":lua require'rust-tools.ssr'.ssr()<cr>", "Structural search and replace" },
	},

	d = {
		name = "Debugger",
		b = { ":lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
		B = { ":lua require'dap'.toggle_breakpoint()<cr>", "Clear breakpoint" },
		d = { ":lua require'dap'.continue()<cr>", "Continue" },
		n = { ":lua require'dap'.step_over()<cr>", "Step over" },
		N = { ":lua require'dap'.step_into()<cr>", "Step into" },
		t = { ":lua require'dap'.terminate()<cr>", "Terminate" },
		u = { ":lua require'dapui'.toggle()<cr>", "Toggle ui" },
	},
	s = {
		name = "Search",
		r = { ":Telescope resume<cr>", "Resume last search" },
		m = { ":Telescope man_pages<cr>", "Man pages" },
		h = { ":Telescope help_tags<cr>", "Help" },
		C = { ":Telescope commands<cr>", "Commands" },
	},
}

local lspopts = {
	mode = "n",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local lspmappings = {
	g = {
		c = {
			name = "Comment",
			c = "Toggle line",
			-- A = "Add comment after",
			o = "Add comment under",
			O = "which_key_ignore",
		},
		b = "which_key_ignore",
		d = { ":Telescope lsp_definitions<cr>", "Definition" },
		D = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		i = { ":Telescope lsp_implementations<cr>", "Implementation" },
		r = { ":Telescope lsp_references<cr>", "References" },
		l = { ":lua vim.diagnostic.open_float()<CR>", "Diagnostic" },
	},
}
local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(lspmappings, lspopts)
