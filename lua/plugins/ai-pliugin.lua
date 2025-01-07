return {
    "windwp/nvim-autopairs",
    config = function()
        local codeium_enabled = true


       local function toggle_codeium()
            if codeium_enabled then
                codeium_enabled = false
                vim.cmd("Codeium Disable")
                vim.notify("Codeium is now disabled", vim.log.levels.INFO)
            else
                codeium_enabled = true
                vim.cmd("Codeium Enable")
                vim.notify("Codeium is now enabled", vim.log.levels.INFO)
            end
        end

        -- Load and configure Codeium
        local codeium = require("codeium")
        codeium.setup({
            virtual_text = {
                enabled = true,
                filetypes = {
                    python = true,
                    lua = true,
                },
                default_filetype_enabled = true,
                idle_delay = 75,
                virtual_text_priority = 65535,
                map_keys = true,
                key_bindings = {
                    accept = "<Tab>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    clear = "<C-l>",
                },
            },
            enable_cmp_source = true,
        })

        -- Add a keymap to toggle Codeium
        vim.api.nvim_set_keymap(
            "n",
            "<leader>ct", -- Replace with your preferred key combination
            ":lua toggle_codeium()<CR>",
            { noremap = true, silent = true }
        )
    end,
}

