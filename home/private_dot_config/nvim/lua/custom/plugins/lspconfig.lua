-- LSP Plugins
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
      }
    })
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("fidget").setup({})

    -- Remove Mason setup
    -- require("mason").setup()
    -- require("mason-lspconfig").setup({...})

    -- Setup for system-installed language servers
    local lspconfig = require("lspconfig")

    -- Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "Lua 5.1" },
          diagnostics = {
            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
          }
        }
      }
    }

    -- Rust
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
    }

    -- Go
    lspconfig.gopls.setup {
      capabilities = capabilities,
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses ={
            unusedparams = true,
          },
          completeUnimported = true,
          usePlaceholders = true,
        },
      },
    }

    -- Python
    lspconfig.pyright.setup {
      capabilities = capabilities,
    }

    -- C/C++
    lspconfig.clangd.setup {
      capabilities = capabilities,
    }

    -- Zig (if you have it installed)
    lspconfig.zls.setup {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
      settings = {
        zls = {
          enable_inlay_hints = true,
          enable_snippets = true,
          warn_style = true,
        },
      },
    }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
          { name = 'buffer' },
        })
    })

    vim.diagnostic.config({
      virtual_text = {
        current_line = true
      }
    })
  end
}
-- vim: ts=2 sts=2 sw=2 et
