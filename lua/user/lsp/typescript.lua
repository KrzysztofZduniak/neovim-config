local M = {}

M.setup = function()
  local status_ok, ts = pcall(require, "typescript.nvim")
	if not status_ok then
		return
	end
  local opts = {}
  ts.setup(opts)
end
return M
