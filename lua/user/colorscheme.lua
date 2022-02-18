local colorscheme = "darkplus"
-- base16-apathy
-- base16-darkmoss
-- base16-horizon-dark
-- onedarker
-- darkplus


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
