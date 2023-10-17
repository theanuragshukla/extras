return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,}
        use("nvim-treesitter/playground")
        use("theprimeagen/harpoon")
        use("theprimeagen/refactoring.nvim")
        use("mbbill/undotree")
        use("tpope/vim-fugitive")
        use("nvim-treesitter/nvim-treesitter-context");

        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                {'neovim/nvim-lspconfig'},
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            }
        }

        use { 'embark-theme/vim', as = 'embark' }
        use { 'folke/tokyonight.nvim' }
        use("folke/zen-mode.nvim")
        use("eandrju/cellular-automaton.nvim")
        use("laytan/cloak.nvim")
        use 'shaunsingh/nord.nvim'
        use('jiangmiao/auto-pairs')
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }
        use {
            'prettier/vim-prettier',
            run = 'npm install',
            ft = {'javascript', "python",  'typescript', 'css','scss', 'markdown', 'html'}
        }

    end)

