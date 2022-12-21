require("user.plugins")

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

impatient.enable_profile()

require("user.options")
require("user.keybindings")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.null-ls")
require("user.lualine")
require("user.indentline")
require("user.whichkey")
require("user.presence")
require("user.toggleterm")

local colorscheme = "oxocarbon"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  vim.cmd("colorscheme darkplus")
  return
end

vim.api.nvim_create_autocmd("TextYankPost", {
  -- group = highlight,
  callback = function()
    vim.highlight.on_yank({
      higroup = "",
      timeout = 40,
    })
    return true
  end,
})

-- base16-apathy
-- base16-darkmoss
-- base16-horizon-dark
-- onedarker
-- darkplus
