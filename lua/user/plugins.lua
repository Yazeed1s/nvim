local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
     -- Plugin Mangager
    use "wbthomason/packer.nvim" -- Have packer manage itself
    
    use {
        "simrat39/rust-tools.nvim",
        config = function()
            local lsp_installer_servers = require "nvim-lsp-installer.servers"
            local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
            require("rust-tools").setup({
                tools = {
                    autoSetHints = true,
                    hover_with_actions = true,
                    runnables = {
                        use_telescope = true,
                    },
                },
                server = {
                    cmd_env = requested_server._default_options.cmd_env,
                    on_attach = require("lvim.lsp").common_on_attach,
                    on_init = require("lvim.lsp").common_on_init,
                },
                -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                hover_actions = {
                    -- the border that is used for the hover window
                    -- see vim.api.nvim_open_win()
                    border = {
                        { "╭", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╮", "FloatBorder" },
                        { "│", "FloatBorder" },
                        { "╯", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╰", "FloatBorder" },
                        { "│", "FloatBorder" },
                    },
                    -- whether the hover action window gets automatically focused
                    -- default: false
                    auto_focus = false,
                },

            })
        end,
        ft = { "rust", "rs" },
    }
    use "p00f/clangd_extensions.nvim"
    -- Comment
    use "numToStr/Comment.nvim"
      -- Quickfix
    
    use {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = {
                        "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█"
                    },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = {
                            ["ctrl-s"] = "split"
                        },
                        extra_opts = {
                            "--bind",
                            "ctrl-o:toggle-all",
                            "--prompt", "> "
                        },
                    },
                },
            })
        end,
    }
    -- using packer.nvim
    use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
    -- colorscheme
    use 'Yazeed1s/oh-lucy.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
        require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
        end
    }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
        }
    -- syntax
    -- Syntax/Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "nvim-treesitter/playground"
    use "windwp/nvim-ts-autotag"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    -- use "wellle/targets.vim"
    -- use "RRethy/nvim-treesitter-textsubjects"
    use "kylechui/nvim-surround"
    use "windwp/nvim-autopairs"
    use {
        "abecodes/tabout.nvim",
        requires = { "nvim-treesitter" }, 
    }
    use "lukas-reineke/indent-blankline.nvim"
    -- file manager
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "ray-x/lsp_signature.nvim"
    use "SmiteshP/nvim-navic"
    use "simrat39/symbols-outline.nvim"
    use "b0o/SchemaStore.nvim"
    -- hints 
    use "lvimuser/lsp-inlayhints.nvim"
    -- 
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
        end
    })
    -- nvim-cmp
     -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"
    use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", 
    run = "./install.sh" }

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
     }
    use "f-person/git-blame.nvim"
    use "ruifm/gitlinker.nvim"

      -- Keybinding
    use "folke/which-key.nvim"
    use { 'weilbith/nvim-code-action-menu' }
    -- Snippet
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
     -- Automatically set up your configuration after cloning packer.nvim
     -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
