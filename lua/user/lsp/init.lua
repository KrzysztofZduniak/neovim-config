require("mason").setup({})
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local handlers = require("user.lsp.handlers")
handlers.setup()

-- TODO TypeScript

require("user.lsp.rust").setup()

require("typescript").setup({
	disable_commands = false,
	debug = false,
	server = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	},
})

local opts = require("user.lsp.servers").opts
for server, opt in pairs(opts) do
	lspconfig[server].setup({
		on_attach = handlers.on_attach,
		settings = opt,
		capabilities = handlers.capabilities,
	})
end
