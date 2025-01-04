-- return {
--   {
--     "williamboman/mason.nvim",
--     lazy = false,
--     config = function()
--       require("mason").setup()
--     end,
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",

--     lazy = false,
--     opts = {
--       auto_install = true,
--     },

--   },
--   {
--     "neovim/nvim-lspconfig",
--     lazy = false,
--     config = function()

--       local lspconfig = require("lspconfig")
--       lspconfig.tsserver.setup({
--         capabilities = capabilities
--       })
--       lspconfig.solargraph.setup({
--         capabilities = capabilities
--       })
--       lspconfig.html.setup({
--         capabilities = capabilities
--       })
--       lspconfig.lua_ls.setup({
--         capabilities = capabilities
--       })

--       vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--       vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--       vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--       vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--     end,
--   },
-- }
-----------------------------------------------------------------------------------------------------------------

-- return {
--   {
--     "williamboman/mason.nvim",
--     lazy = false,
--     config = function()
--       require("mason").setup()
--     end,
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     lazy = false,
--     opts = {
--       auto_install = true,
--     },
--   },
--   {
--     "neovim/nvim-lspconfig",
--     lazy = false,
--     config = function()
--       local lspconfig = require("lspconfig")
--       local capabilities = require("cmp_nvim_lsp").default_capabilities()

--       -- LSP servers setup
--       local servers = {
--         "tsserver",      -- TypeScript/JavaScript
--         "tailwindcss",   -- Tailwind CSS
--         "html",          -- HTML
--         "cssls",         -- CSS
--         "pyright",       -- Python
--         "rust_analyzer", -- Rust
--         "clangd",        -- C/C++
--         "omnisharp",     -- C#
--         "lua_ls",        -- Lua
--         "bashls",        -- Bash
--         "jsonls",        -- JSON
--         "yamlls",        -- YAML
--         "vimls",         -- Vimscript
--       }

--       for _, server in ipairs(servers) do
--         lspconfig[server].setup({
--           capabilities = capabilities,
--         })
--       end

--       -- Lua-specific settings
--       lspconfig.lua_ls.setup({
--         capabilities = capabilities,
--         settings = {
--           Lua = {
--             runtime = { version = "LuaJIT" },
--             diagnostics = { globals = { "vim" } },
--             workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--             telemetry = { enable = false },
--           },
--         },
--       })

--       -- Rust-specific settings
--       lspconfig.rust_analyzer.setup({
--         capabilities = capabilities,
--         settings = {
--           ["rust-analyzer"] = {
--             cargo = { allFeatures = true },
--             procMacro = { enable = true },
--           },
--         },
--       })

--       -- Keybindings
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--       vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--       vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--       vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--       vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
--       vim.keymap.set("n", "<leader>f", function()
--         vim.lsp.buf.format { async = true }
--       end, {})
--     end,
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     lazy = false,
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "L3MON4D3/LuaSnip",
--       "saadparwaiz1/cmp_luasnip",
--     },
--     config = function()
--       local cmp = require("cmp")
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--           end,
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "luasnip" },
--         }, {
--           { name = "buffer" },
--         }),
--       })
--     end,
--   },
-- }

----------------------------------------------------------------------------------------------------------------


return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP servers setup
      local servers = {
        "ts_ls", "tailwindcss", "html", "cssls", "pyright",
        "rust_analyzer", "clangd", "omnisharp", "lua_ls", "bashls",
        "jsonls", "yamlls", "vimls"
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Could be '●', '▎', 'x'
          spacing = 4,  -- Spacing between the diagnostic and the text
        },
        signs = true,   -- Show signs in the gutter
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Define diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Keybindings for diagnostics
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostics in location list" })

      -- Floating diagnostic window on cursor hold
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
        end,
      })

      -- General LSP keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature help" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },
}

