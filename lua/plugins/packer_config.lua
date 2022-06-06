local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

---gerenciador
-- vim.cmd 'packadd paq-nvim'
return require("packer").startup({
  function()
    use({ -- melhorar velocidade de inicialização com JIT
      "lewis6991/impatient.nvim",
    })

    use({
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    })
    use({
      "lukas-reineke/lsp-format.nvim",
      config = function()
        require("plugins/lsp-format_config")
      end,
    })
    use({ -- carregamento do LSP
      "j-hui/fidget.nvim",
      config = function()
        require("fidget").setup()
      end,
    })
    use({ -- mostrar numero da linha na inserção
      "nkakouros-original/numbers.nvim",
      config = function()
        require("numbers").setup()
      end,
    })
    use("wbthomason/packer.nvim")
    use({ -- melhorar os focus quando tem varias janelas
      "beauwilliams/focus.nvim",
      config = function()
        require("plugins/focus_config")
      end,
    })
    use( --parenteses coloridos
      "p00f/nvim-ts-rainbow"
    )
    use({ -- realçar pesquisa
      "m-demare/hlargs.nvim",
      requires = { "nvim-treesitter/nvim-treesitter" },
    })
    use({
      "haringsrob/nvim_context_vt",
    })
    use({ -- melhor aparencia dos fold(recolher blocos)
      "anuvyklack/pretty-fold.nvim",
      requires = "anuvyklack/nvim-keymap-amend", -- only for preview
      config = function()
        require("plugins/pretty-fold_config")
      end,
    })
    use({ -- fsharp syntax highlight
      "PhilT/vim-fsharp",
    })
    use({ -- simbolos no menu
      "onsails/lspkind-nvim",
    })
    use({ -- nem to usando
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("plugins/lsp_lines_config")
      end,
    })
    use({ -- mover itens selecionados
      "booperlv/nvim-gomove",
      config = function()
        require("gomove").setup({})
      end,
    })

    use({ -- configurar depois
      "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup()
      end,
    })
    use({ --configurar depois
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup()
      end,
    })
    use({ -- mostrar metodos enquanto escreve
      "ray-x/lsp_signature.nvim",
      config = function()
        require("plugins/lsp_signature_config")
      end,
    })
    use({ --mostrar indendação
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugins/indent-blankline_config")
      end,
    })
    use({ -- tema
      "projekt0n/github-nvim-theme",
      config = function()
        require("plugins/github-theme_config")
      end,
    })
    use( --simbolos lsp pro tema
      "folke/lsp-colors.nvim"
    )
    use({ -- nem to usando
      "echasnovski/mini.nvim",
      branch = "stable",
      config = function()
        require("plugins/mini_config")
      end,
    })
    use({ --listagem do copiar
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup({})
      end,
    })
    use({ --mostrar marcas
      "chentoast/marks.nvim",
      config = function()
        require("marks").setup({})
      end,
    })
    use({ --comentarios
      "b3nj5m1n/kommentary",
      config = function()
        require("plugins/kommentary_config")
      end,
    })
    use({ -- nem to usando
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({})
      end,
    })
    use({ -- integração telescope para procurar arquivos
      "nvim-telescope/telescope-file-browser.nvim",
      config = function()
        require("telescope").load_extension("file_browser")
      end,
    })
    use({ -- finder
      --deps : fd, ripgrep
      "nvim-telescope/telescope.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons" },
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    })
    use({ -- notificações
      "rcarriga/nvim-notify",
      config = function()
        require("plugins/nvim-notify_config")
      end,
    })
    use({ --formatador de arquivos
      "mhartington/formatter.nvim",
      config = function()
        require("plugins/formatter_config")
      end,
    })

    use({ -- executar arquivos
      "skywind3000/asyncrun.extra",
      requires = {
        { "skywind3000/asyncrun.vim" },
        { "voldikss/vim-floaterm" },
      },
      config = function()
        require("plugins/asyncrun_config")
      end,
    })
    use({ --debug
      "mfussenegger/nvim-dap",
      requires = {
        {
          --- mostrar valores no codigo
          "theHamsta/nvim-dap-virtual-text",
          requires = "nvim-treesitter/nvim-treesitter",
        },
        { "rcarriga/nvim-dap-ui" },
      },
      config = function()
        require("plugins/debugando")
      end,
    })
    use({ --escurecer bloco não atual, n funcionou
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup({})
      end,
    })
    use({ --mostrar combinações de teclas possiveis
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end,
    })
    use({ --movimentação suave
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup({})
      end,
    })
    use( --lista de variaveis e funções
      "liuchengxu/vista.vim"
    )
    use("simrat39/symbols-outline.nvim")
    -- simrat39/symbols-outline.nvim
    use({ --janela com erros
      "folke/lsp-trouble.nvim",
      config = function()
        require("trouble").setup()
      end,
    })
    use({ --explorador de arquivos
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("plugins/nvim-tree_config")
      end,
    })
    use({ --statusline
      "hoob3rt/lualine.nvim",
      after = "github-nvim-theme",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugins/lualine_config")
      end,
    })

    use({ --fechar paretes,chaves
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end,
    })
    use({ --flutter
      "akinsho/flutter-tools.nvim",
      ft = { "dart" },
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
      config = function()
        require("plugins/flutter-tools_config")
      end,
    })
    use({ -- mostrar tipos no codigo
      "https://github.com/jubnzv/virtual-types.nvim",
    })
    use({ --rust
      "simrat39/rust-tools.nvim",
      ft = { "rust" },
      requires = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      },
      config = function()
        require("plugins/rust-tools_config")
      end,
    })
    -- ; "TimUntersberger/neogit"
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("plugins/nvim-treesitter_config")
      end,
    })
    -- -- use({
    -- --     -- "shift-d/crates.nvim",
    -- --     "mhinz/vim-crates",
    -- --     -- "Saecki/crates.nvim",
    -- --     event = { "BufRead Cargo.toml" },
    -- --     config = vim.cmd([[call crates#toggle()]]),
    -- -- })

    -- use({ --melhora no uso do lsp(fonte)
    -- -- desativei porque não funciona junto de outros plugins que configura LSP
    --   "ray-x/navigator.lua",
    --   requires = {
    --     { "nvim-treesitter/nvim-treesitter" },
    --     { "neovim/nvim-lspconfig" },
    --     { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    --   },
    --   config = function()
    --     require("plugins/navigator_config")
    --   end,
    -- })
    use({ -- melhorar interação com LSP
      "tami5/lspsaga.nvim",
      branch = "nvim6.0",
      config = function()
        require("plugins/lspsaga_config")
      end,
    })
    use({ --tabs/guias superiores, nem to usando teste
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      -- config = function()
      --   require("plugins/bufferline_config")
      -- end,
    })
    use({
      "neovim/nvim-lspconfig",
      -- ft = { "haskell", "fsharp", "python", "cpp" },
      config = function()
        require("plugins/lspconfig_config")
      end,
    })

    use({ --configurar completar
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp", requires = "neovim/nvim-lspconfig" },
        "hrsh7th/cmp-path",
        "lukas-reineke/cmp-rg",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "lukas-reineke/cmp-under-comparator",
        {
          "hrsh7th/cmp-vsnip",
          requires = {
            {
              "hrsh7th/vim-vsnip", -- motor de snippets
              requires = {
                "rafamadriz/friendly-snippets", -- snippets(formato json)
              },
            },
          },
        },
      },
      config = function()
        require("plugins/cmp_config")
      end,
    })

    use({ --mostrar coinscidencias do cursor
      "xiyaowong/nvim-cursorword",
    })

    use({ --tela inicial
      "glepnir/dashboard-nvim",
    })

    use({ --mostrar cores hexa
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    })
    -- use({ --estabilizar/centralizar buffet quando abre um novo
    --   "luukvbaal/stabilize.nvim",
    --   config = function()
    --     require("stabilize").setup()
    --   end,
    -- })
    ---impedir que apagar linha mande elas para o copiar/colar
    -- use({
    --     "gbprod/cutlass.nvim",
    -- })
    if packer_bootstrap then
      require("packer").sync()
    end
  end,

  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua",

    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
