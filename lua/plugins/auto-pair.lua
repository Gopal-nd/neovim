return {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" }, -- Disable in certain file types if needed
        check_ts = true,  -- Enable Treesitter integration
      })

      -- Optional: Integrate with nvim-cmp if you use it for completion
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  }
