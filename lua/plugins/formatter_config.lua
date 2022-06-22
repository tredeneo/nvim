vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.fs,*.lua FormatWrite
augroup END
]],
  true
)

require("formatter").setup({
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "-", "--indent-type Spaces", "--indent-width 2" },
          stdin = true,
        }
      end,
    },
    fsharp = {
      function()
        return {
          exe = "fantomas",
          args = { vim.api.nvim_buf_get_name(0), "--stdout" },
          stdin = true,
        }
      end,
    },
  },
})
