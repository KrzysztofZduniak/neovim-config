---@diagnostic disable: unused-local
local ls_status_ok, ls = pcall(require, "luasnip")
if not ls_status_ok then
  return
end

local types = require("luasnip.util.types")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

ls.setup({
  history = false,
  update_events = { "TextChanged", "TextChangedI" },
  enable_autosnippets = true,
  delete_check_events = "InsertLeave",
  region_check_events = "CursorMoved",
})

ls.add_snippets("all", {
  s("simple", ls.text_node("simple snippet")),
})

ls.add_snippets("lua", {
  s(
    "req",
    fmt([[local {} = require'{}']], {
      f(function(import_name)
        return import_name[1]
      end, { 1 }),
      i(1),
    })
  ),
})
