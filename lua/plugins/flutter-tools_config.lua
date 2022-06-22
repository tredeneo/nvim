require("telescope").load_extension("flutter")
require("flutter-tools").setup({
  widget_guides = {
    enable = true,
  },
  lsp = {
    on_attach = require("lsp-format").on_attach,
  },
  debugger = {
    enable = true,
  },
})
