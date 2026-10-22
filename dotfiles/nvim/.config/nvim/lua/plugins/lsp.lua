return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "djlint",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",

        "jdtls",

        "basedpyright",
        "ruff",

        "ts_ls",
        "eslint",
        "html",
        "cssls",
        "emmet_language_server",

        "jsonls",
        "bashls",
        "jinja_lsp",

        "yamlls",

        "dockerls",
        "docker_compose_language_service",

        "marksman",
      }
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local servers = require("servers")
      for server, opts in pairs(servers) do
        local config = {}
        if opts.cmd or opts.settings then
          config = opts
          if not config.settings then
            config.settings = { [server] = {} }
          end
        else
          config = { settings = { [server] = opts } }
        end
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
