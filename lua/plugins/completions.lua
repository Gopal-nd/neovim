return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },  -- LSP suggestions (like function signatures, etc.)
          { name = "luasnip" },   -- Snippet suggestions (if you use snippets)
          { name = "buffer" },    -- Buffer-based suggestions (for words already in the file)
          { name = "path" },      -- Path-based suggestions (for file paths)
        }),
      })
    end,
  },
  {
    "hrsh7th/cmp-buffer",  -- Buffer source for nvim-cmp
    config = function()
      -- Buffer source configuration (already covered above)
    end,
  },
  {
    "hrsh7th/cmp-path",  -- Path source for nvim-cmp
    config = function()
      -- Path source configuration (already covered above)
    end,
  },
}

