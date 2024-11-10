return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",             -- A Lua library for Neovim that provides useful utilities.
        "nvim-tree/nvim-web-devicons",      -- Adds support for file icons.
        "MunifTanjim/nui.nvim",             -- Required for NeoTree's UI elements.
    },
    config = function()
        -- Setup NeoTree with icons
        require("neo-tree").setup({
            -- Close NeoTree when it’s the last window
            close_if_last_window = true,

            -- Filesystem Configuration
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,       -- Show dotfiles in the file explorer
                    hide_gitignored = true,      -- Hide files ignored by git
                },
                use_libuv_file_watcher = true,  -- Use libuv to watch for file changes
            },

            -- Window Configuration
            window = {
                position = "left",    -- Position of NeoTree: left side of the screen
                width = 30,           -- Width of the NeoTree window
                mappings = {
                    ["<space>"] = "toggle_node",  -- Spacebar to toggle a node
                    ["<cr>"] = "open",           -- Enter to open the selected file
                },
            },

            -- Enabling icons
            renderer = {
                icons = {
                    glyphs = {
                        default = "",          -- Default file icon
                        symlink = "",          -- Symlink icon
                        git = {
                            unstaged = "",     -- Unstaged file icon
                            staged = "S",        -- Staged file icon
                            untracked = "U",     -- Untracked file icon
                            deleted = "",       -- Deleted file icon
                            ignored = "◌",       -- Ignored file icon
                        },
                        folder = {
                            default = "",       -- Default folder icon
                            open = "",          -- Open folder icon
                            empty = "",         -- Empty folder icon
                            empty_open = "",    -- Empty open folder icon
                        },
                    },
                },
            },
        })

        -- Key mappings for toggling NeoTree and opening buffer float
        -- Toggle NeoTree file explorer with <leader>n
        vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })

        -- Reveal buffers in a floating window with <leader>bf
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}

