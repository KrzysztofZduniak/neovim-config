local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local telescope = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

which_key.setup({
	plugins = {
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
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
	window = {
		border = "single", -- none, single, double, shadow
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
})

local mappings = {
	b = {
		function()
			telescope.buffers(telescope_themes.get_dropdown())
		end,
		"Buffers",
	},
	e = { ":NvimTreeToggle<cr>", "File Explorer" },
	w = {
		function()
			vim.lsp.buf.format({ async = false })
			vim.cmd("w!")
		end,
		"Save",
	},
	q = { ":qa<CR>", "Quit" },
	c = { ":Bdelete!<CR>", "Close Buffer" },
	C = { ":%bdelete!<CR>", "Close All Buffer" },
	h = { ":nohlsearch<CR>", "No Highlight" },
	f = {
		function()
			telescope.find_files()
		end,
		"Find files",
	},
	F = {
		function()
			telescope.live_grep(telescope_themes.get_ivy())
		end,
		"Find Text",
	},
	S = {
		function()
			--[[ require("user.utils").ReloadConfig() ]]
			vim.notify("[LOCAL] Lazy.nvim currently doesn't support reloading", vim.log.levels.INFO)
		end,
		"Reload snippets",
	},
	g = {
		name = "Git",
		j = { ":lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { ":lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		p = { ":lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		s = { ":lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { ":lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		b = {
			":Telescope git_branches theme=dropdown<cr>",
			"Checkout branch",
		},
	},
	l = {
		name = "LSP",
		a = {
			function()
				vim.lsp.buf.code_action()
			end,
			"Code Actions",
		},
		d = {
			function()
				telescope.diagnostics()
			end,
			"Diagnostics",
		},
		i = { ":LspInfo<cr>", "Info" },
		j = {
			function()
				vim.diagnostic.goto_next()
			end,
			"Next Diagnostic",
		},
		k = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"Prev Diagnostic",
		},
		q = {
			function()
				telescope.quickfix(telescope_themes.get_dropdown())
			end,
			"QuickFix List",
		},
		r = {
			function()
				vim.lsp.buf.rename()
			end,
			"Rename",
		},
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
	s = {
		name = "Search",
		r = { ":Telescope resume<cr>", "Resume last search" },
		p = { ":Telescope projections<cr>", "Projects" },
		s = { ":Telescope luasnip<cr>", "Snippets" },
		n = { ":Telescope notify<cr>", "Notifications" },
		m = { ":Telescope man_pages sections=1,2,3,4,5,6,7,8,9<cr>", "Man pages" },
		h = { ":Telescope help_tags<cr>", "Help" },
	},
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
		D = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		i = { ":Telescope lsp_implementations<cr>", "Implementation" },
		r = { ":Telescope lsp_references<cr>", "References" },
		l = { ":lua vim.diagnostic.open_float()<CR>", "Diagnostic" },
	},
}
local vmappings = {}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local lspopts = {
	mode = "n",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(lspmappings, lspopts)
