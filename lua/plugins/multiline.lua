return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_default_mappings = 1  -- Enable default key mappings
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",  -- Select the next occurrence
      ["Skip Region"] = "<C-q>",  -- Skip the current match
      ["Remove Region"] = "<C-z>",  -- Remove the current match
      ["Undo"] = "u",  -- Undo changes
      ["Redo"] = "<C-r>",  -- Redo changes
    }

    -- Custom keymap for toggling comments
    vim.api.nvim_set_keymap('n', '<A-c>', ':lua ToggleComment()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<A-c>', ':lua ToggleComment(true)<CR>', { noremap = true, silent = true })
    
    -- Toggle comment function
    function ToggleComment(is_visual)
      local line
      if is_visual then
        -- Get the lines from the visual selection
        local start_line, _, end_line, _ = unpack(vim.fn.getpos("'<"))
        line = vim.fn.getline(start_line, end_line)
      else
        -- If not in visual mode, operate on the current line
        line = {vim.fn.getline('.')}
      end

      local is_commented = true
      -- Check if all selected lines are commented
      for _, l in ipairs(line) do
        if not string.match(l, "^%s*//") then
          is_commented = false
          break
        end
      end

      -- Toggle comment based on whether lines are already commented
      for i, l in ipairs(line) do
        if is_commented then
          -- If lines are commented, remove the comment
          line[i] = string.gsub(l, "^%s*//", "")
        else
          -- If lines are not commented, add a comment
          line[i] = "// " .. l
        end
      end

      if is_visual then
        -- Set the commented/uncommented lines back to the buffer
        vim.fn.setline(start_line, line)
      else
        -- Set the comment/uncomment change to the current line
        vim.fn.setline('.', line)
      end
    end
  end,
}

