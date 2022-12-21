local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- Lua
		formatting.stylua,

		-- python
		formatting.black.with({ extra_args = { "--fast" } }),
		diagnostics.flake8.with({ extra_args = { "--extend-ignore=E501" } }),

		-- rust
		-- formatting.rustfmt,

		-- c/c++
		--[[ formatting.clang_format, ]]
		--[[ diagnostics.cppcheck, ]]

		-- bash
		formatting.shfmt,
		diagnostics.shellcheck,

		-- js
		code_actions.eslint,
		diagnostics.eslint,
		formatting.prettier,

		-- haskell
		formatting.brittany,

		-- code_actions.gitsigns,
	},
})
