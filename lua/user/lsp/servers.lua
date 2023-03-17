local M = {}

M.disable_formatting = {
  "tsserver",
  "rust_analyzer",
  "lua_ls",
  "clangd",
  -- "hls",
  -- "gdscript",
}

local opts = {}
opts.lua_ls = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
    completion = { keywordSnippet = "Disable" },
    worforkspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      },
    },
    format = {
      enable = true,
    },
  },
}
opts.pyright = {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}
opts.clangd = {}
opts.gopls = {}
opts.hls = {
  settings = {
    haskell = {
      cmd = { "haskell-language-server", "--ls" },
    },
  },
}
M.opts = opts

return M
