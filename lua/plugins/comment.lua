return {
  "tpope/vim-commentary",
  config = function()
    -- You don't need to configure anything for basic functionality, it works out of the box.
    -- But you can optionally set mappings if needed.
    
    -- For example, you could set custom mappings for commenting:
    vim.api.nvim_set_keymap("n", "<Leader>c", "gcc", { noremap = true, silent = true })  -- Comment a line
    vim.api.nvim_set_keymap("v", "<Leader>c", "gc", { noremap = true, silent = true })   -- Comment selected block
  end
}

