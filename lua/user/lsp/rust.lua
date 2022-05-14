local M = {}
M.setup = function ()
  local status_ok, r = pcall(require, "rust-tools")
  if not status_ok then
    return
  end

  local extension_path = '/home/krzysztof/.config/codelldb/extension/'
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

  local opts = {
    hover_actions = {
      auto_focus = true,
    },
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }

  r.setup(opts)
end

return M
