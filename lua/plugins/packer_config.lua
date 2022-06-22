local fn = vim.fn 
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" 
if fn.empty(fn.glob(install_path)) > 0 then 
	packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, }) 
end 
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]) 

--gerenciador vim.cmd 'packadd paq-nvim' 
return require("packer").startup({ function() 

	use({ -- melhorar velocidade de inicialização com JIT
	"lewis6991/impatient.nvim", }) 
	use("tpope/vim-surround") 
	use("alvan/vim-closetag") 

    use({ --arvore de arquivos
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
    })
    use{
      "lukas-reineke/lsp-format.nvim",
      config = function()
        require("plugins/lsp-format_config")
      end,
    }
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
    use({ -- realçar argumentos da função
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
    use({ -- mover itens selecionados
      "booperlv/nvim-gomove",
      config = function()
        require("gomove").setup({})
      end,
    })

    use({ -- realçar itens pesquisados
      "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup()
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
    use({ --escurecer bloco não atual
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
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("plugins/nvim-treesitter_config")
      end,
    })
     use({ -- melhorar interação com LSP
      "tami5/lspsaga.nvim",
      branch = "nvim6.0",
      config = function()
        require("lspsaga").setup()
      end,
    })
    use({
      "neovim/nvim-lspconfig",
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
        require("colorizer").setup({
          css = { rgb_fn = true },
        })
      end,
    })
    use({ --estabilizar/centralizar buffet quando abre um novo
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end,
    })
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
