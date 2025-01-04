return {
    "Exafunction/codeium.nvim",
    config = function()
        local codeium = require("codeium")
        -- Setup Codeium
        -- codeium.setup({
        --     -- Enable virtual text for completions
        --     virtual_text = {
        --         enabled = true,
        --         filetypes = { 
        --             python = true,  -- Enable virtual text for Python files
        --             lua = true,     -- Enable virtual text for Lua files
        --         },
        --         default_filetype_enabled = true,  -- Enable virtual text by default for other filetypes
        --         idle_delay = 75,  -- Time in ms to wait before requesting completions after typing stops
        --         virtual_text_priority = 65535,  -- Priority of virtual text
        --         map_keys = true,  -- Enable key mappings for virtual text actions
        --         key_bindings = {
        --             accept = "<Tab>",    -- Accept current completion with Tab
        --             next = "<M-]>",      -- Go to the next completion suggestion
        --             prev = "<M-[>",      -- Go to the previous completion suggestion
        --             clear = "<C-l>",     -- Clear the virtual text
        --         },
        --     },
        --     -- Enable the CMP source for Codeium (if using nvim-cmp)
        --     enable_cmp_source = true,
        -- })

        -- -- Create command to disable Codeium
        -- vim.api.nvim_create_user_command("DisableCodeium", function()
        --     vim.cmd("Codeium Disable")
        --     vim.notify("Codeium is now disabled", vim.log.levels.INFO)
        -- end, {})

        -- -- Add keybinding to disable Codeium
        -- vim.api.nvim_set_keymap(
        --     "n",
        --     "<leader>cd",
        --     ":DisableCodeium<CR>",
        --     { noremap = true, silent = true }
        -- )
    end
}
