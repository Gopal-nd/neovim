return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require("toggleterm").setup{
      size = 20, -- Default terminal height
      open_mapping = [[<C-t>]],
      hide_numbers = true, -- Hide line numbers in terminal buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2, -- The amount of shading to apply to terminal
      start_in_insert = true, -- Start terminal in insert mode
      persist_size = true,
      direction = 'horizontal', -- Other options: 'vertical', 'float'
      close_on_exit = true, -- Automatically close the terminal when the process exits
      shell = vim.o.shell, -- Use the default shell
      float_opts = {
        border = 'curved', -- Border options: 'single', 'double', 'shadow', etc.
        winblend = 3,
      }
    }

    
  end
}

