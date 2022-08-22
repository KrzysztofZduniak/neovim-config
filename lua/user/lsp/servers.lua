local M = {}

M.disable_formatting = {
	"tsserver",
	"rust_analyzer",
	"sumneko_lua",
	"clangd",
  -- "hls",
  -- "gdscript",
}

local opts = {}
opts.sumneko_lua = {
	Lua = {
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
	},
}
opts.pyright = {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
}
opts.clangd = {}
opts.hls = {
	settings = {
		haskell = {
			cmd = { "haskell-language-server", "--ls" },
		},
	},
}
M.opts = opts

return M
