M = {}

local ht = require("haskell-tools")
local def_opts = { noremap = true, silent = true }

M.setup = function()
  ht.setup({
    hls = { on_attach = require("user.lsp.handlers").on_attach },
  })
end
