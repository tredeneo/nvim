vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.jsx,*.dart,*.fs,*.c,*.py,*.rs,*.lua FormatWrite
augroup END
]],
  true
)
require("formatter").setup({
  filetype = {
    dart = {
      function()
        return {
          exe = "flutter",
          args = { "format", vim.api.nvim_buf_get_name(0), "-o show" },
          stdin = true,
        }
      end,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    c = {
      function()
        return {
          exe = "clang-format",
          args = { "--assume-filename=", vim.api.nvim_buf_get_name(0), "--style=microsoft" },
          stdin = true,
        }
      end,
    },
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
