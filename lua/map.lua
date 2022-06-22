local opts = { noremap = true, silent = true }
local wk = require("which-key")
vim.api.nvim_set_keymap("n", "<F9>", [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F10>", [[<cmd>lua require'dap'.step_into()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F11>", [[<cmd>lua require'dap'.step_over()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<F12>", [[<cmd>lua require'dap'.continue()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-f>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
vim.api.nvim_set_keymap("n", "<C-b>", [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
vim.api.nvim_set_keymap("v", "<space>ca", [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], opts)
wk.register({
  ["<space>"] = {
    name = "lsp",
    ["D"] = "which_key_ignore",
    w = {
      name = "projetos",
      a = { "adicionar pasta ao projeto" },
      r = { "remover pasto do projeto" },
      l = { "listar pastas do projeto" },
    },
    ff = { "formatar arquivo" },
    c = {
      name = "sugestão de codigo",
      a = { [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], "sugestão de codigo" },
    },
    k = { [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], "hover" },
    r = { [[<cmd>lua require('lspsaga.rename').rename()<CR>]], "renomear" },
    b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "buffers" },
  },
  g = {
    name = "atalhos LSP",

    d = { [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], "ir definição" },
    p = { "ver definição" },
    ["0"] = { "ver simbolos do arquivos" },
    L = { [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], "mostrar erros" },
    i = { "ir para implementação" },
  },
  ["["] = {
    d = { "erro anterior" },
    r = { "referencia anterior" },
  },
  ["]"] = {
    d = { "erro posterior" },
    r = { "referencia posterior" },
  },
  ---finder
  ["<leader>"] = {
    name = "telescope",
    f = {
      name = "procurador",
      a = { [[<cmd>lua require('telescope.builtin').find_files()<cr>]], "arquivos  (diretorio atual)" }, ---dep=bat,ripgrep
      g = { [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], "procurar string no diretorio atual" },
      h = { [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], "help_tags" },
      d = { [[<cmd>lua require('telescope.builtin').builtin()<cr>]], "menus disponiveis" },
      b = {
        [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]],
        "arquivos e pastas  (diretorio atual)",
      },
      f = { [[<cmd>lua require('telescope').extensions.flutter.commands()<cr>]], "flutter" },
      t = { [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], "treesitter" },
      c = { [[<cmd>lua require('telescope').extensions.neoclip.commands()<cr>]], "neoclip" },
      p = { [[<cmd>lua require('telescope').extensions.projects.commands()<cr>]], "projetos" },
    },
    g = "which_key_ignore",
    r = "which_key_ignore",
  },
})

---cancelar carecteres selecionados
vim.api.nvim_set_keymap("n", "<ESC>", ":nohlsearch<CR> ", opts)

---copiar colocar, fora do editor
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { silent = true })
vim.api.nvim_set_keymap("v", "<C-x>", '"+x', { silent = true })
-- vim.api.nvim_set_keymap("v","<C-v>","\"+gP",{silent=true})

---explorador de arquivos
-- vim.api.nvim_set_keymap("n", "<C-n>", [[<cmd> lua require'nvim-tree'.toggle()<CR>]], {
--   noremap = false,
--   silent = true,
-- })
vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree float toggle<CR>", {
  noremap = false,
  silent = true,
})
vim.api.nvim_set_keymap("n", "<C-b>", ":Neotree buffers<CR>", {
  noremap = false,
  silent = true,
})
--trocar aba
-- vim.api.nvim_set_keymap("n", "<Tab>", ":bn<CR>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":bp<CR>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<C-w>w", ":bd<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "K", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<F5>", [[<cmd> lua executar_fecha()<CR>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<F6>", [[<cmd> lua executar_fica()<CR>]], { noremap = true })
