require("user.debugger.adapters")
local dap = require("user.debugger.configuration")
local ui = require("user.debugger.ui")

dap.listeners.after.event_initialized["dapui_config"] = function ()
  ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
  ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
  ui.close()
end
