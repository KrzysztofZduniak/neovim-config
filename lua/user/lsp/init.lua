require("nvim-lsp-installer").setup{}
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local handlers = require'user.lsp.handlers'
handlers.setup()

-- TODO TypeScript

require'user.lsp.rust'.setup()

local servers = {
	"sumneko_lua",
	"pyright",
  "clangd",
  "julials",
  "hls"
}

for _, server in ipairs(servers) do
  local server_status_ok, settings = pcall(require, 'user.lsp.settings.'..server)
  if not server_status_ok then
    settings = {}
  end
  lspconfig[server].setup{
    on_attach = handlers.on_attach,
    settings = settings,
    capabilities = handlers.capabilities,
  }
end

