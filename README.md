## Nvim Shortcuts

```
CTRL - t   # to open termianl and toogle the terminal open and close
```

#### THEME

go to nvim/lua/plugins/catpuuccin.lua

change it accordingle

#### AUTO Completions

```lua
  mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
}),
```

#### GIT HUB

```lua
 vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

```

#### LSP config

```lua
 .keymap.set("n", "K", .lsp.buf.hover, {})
      .keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
```

#### NEO tree

```lua
    vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })

	vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
# use this " - " to see directory
```

#### Formating Code

```lua
  vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
```


#### serach in the file TELESCOPE

```lua
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

```

#### multi cursor

works in the visula or normal mode

```txt

`ctrl + n`  to select the multi line
`ctrl + q`  to skip the current one  the selecte next one

```

#### comments and multi line comments

1. `gcc` in visula mode to comment one line
2. `gc` to comment selected section ising the `shift + V`

Learn Vim Motions

[youtube](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)
