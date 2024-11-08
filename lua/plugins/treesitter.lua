return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	local config = require("nvim-treesitter.configs")
config.setup({
ensure_installed = { "c", "javascript","lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
auto_install = true,
highlight = {enable=true},
indent = {enable=true},
})
     end
  }
}
