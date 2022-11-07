local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

-- auto compile when there are changes in `plugins.lua`
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = [[source <afile> | PackerCompile]],
})

vim.cmd([[packadd packer.nvim]])

require("packer").startup({
  function(use)
    -- Let packer manage itself
    use("wbthomason/packer.nvim")
    -- Cache all the things
    use("lewis6991/impatient.nvim")

    use({
      "windwp/nvim-autopairs",
      config = function()
        local npairs = require("nvim-autopairs")

        npairs.setup({
          check_ts = true,
        })

        npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
        npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
      end,
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate", -- We recommend updating the parsers on update
    })
    use({
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    })
    use({
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    })

    use({
      "AckslD/nvim-FeMaco.lua",
      config = [[require("femaco").setup()]],
      cmd = "FeMaco",
    })

    -- Allows for motions within/around underscores. e.g. `i_` or `a_`
    use({
      "lucapette/vim-textobj-underscore",
      requires = "kana/vim-textobj-user",
    })

    -- To keep track of bindings
    use({
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          key_labels = {
            ["<leader>"] = "SPC",
          },
        })
      end,
    })

    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = [[require("todo-comments").setup()]],
    })

    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[require("trouble").setup()]],
    })

    -- Finders
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    })
    use({
      "princejoogie/dir-telescope.nvim",
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("dir-telescope").setup({
          hidden = true,
          respect_gitignore = true,
        })
      end,
    })
    use({
      "LukasPietzschmann/telescope-tabs",
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("telescope-tabs").setup()
      end,
    })

    use({
      "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup({
          input = {
            -- No transparency for input window
            winblend = 0,
          },
          select = {
            telescope = require("telescope.themes").get_dropdown({}),
          },
        })
      end,
    })

    use("neovim/nvim-lspconfig")
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use({
      "j-hui/fidget.nvim",
      config = [[require("fidget").setup()]],
    })

    use({
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    })

    use({
      "neanias/everforest-nvim",
      config = function()
        require("everforest").setup({
          background = "medium",
        })
        vim.cmd([[colorscheme everforest]])
      end
    })

    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("lualine").setup({
          options = { theme = "auto" },
          extensions = { "nvim-tree", "fugitive" },
          sections = {
            lualine_x = {
              {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = { fg = "#ff9e64" },
              },
            },
          },
        })
      end,
    })
    use({
      "akinsho/bufferline.nvim",
      tag = "v2.*",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[require("bufferline").setup()]],
    })

    use({
      "kylechui/nvim-surround",
      config = [[require("nvim-surround").setup()]],
    })

    -- TPope time
    use({
      "tpope/vim-abolish",
      "tpope/vim-eunuch",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
      "tpope/vim-obsession",
      "tpope/vim-projectionist",
      "tpope/vim-repeat",
      "tpope/vim-unimpaired",
    })

    use({ "tpope/vim-rails", ft = { "ruby", "eruby", "haml", "slim", "coffee" } })
    use({ "tpope/vim-rake", ft = "ruby" })

    -- Better commenting
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({
          toggler = {
            line = "<leader>cc",
            block = "<leader>cb",
          },
          opleader = {
            line = "<leader>cc",
            block = "<leader>cb",
          },
          extra = {
            above = "<leader>cO",
            below = "<leader>co",
            eol = "<leader>cA",
          },
        })
      end,
    })

    -- Nice file browsing
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-tree").setup({})
      end,
    })

    use({
      "mbbill/undotree",
      cmd = "UndotreeToggle",
    })

    use({
      "narutoxy/silicon.lua",
      requires = { "nvim-lua/plenary.nvim" },
      config = [[require("silicon").setup()]],
    })

    use({
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    })

    use({
      "nyngwang/NeoZoom.lua",
      config = function()
        require("neo-zoom").setup()
      end,
    })

    use({
      "folke/noice.nvim",
      event = "VimEnter",
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      config = function()
        require("noice").setup({
          cmdline = {
            format = {
              search_down = {
                view = "cmdline",
              },
              search_up = {
                view = "cmdline",
              },
            },
          },
          routes = {
            -- Hide written message
            {
              filter = {
                event = "msg_show",
                kind = "",
                find = "written",
              },
              opts = { skip = true },
            },
          },
          -- Combine cmdline & popupmenu together
          views = {
            cmdline_popup = {
              position = {
                row = 5,
                col = "50%",
              },
              size = {
                width = 60,
                height = "auto",
              },
            },
            popupmenu = {
              relative = "editor",
              position = {
                row = 8,
                col = "50%",
              },
              size = {
                width = 60,
                height = 10,
              },
              border = {
                style = "rounded",
                padding = { 0, 1 },
              },
              win_options = {
                winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
              },
            },
          },
        })
      end,
    })

    -- Syntax & languages
    use({ "jmcantrell/vim-virtualenv", ft = "python" })
    use({ "slashmili/alchemist.vim", ft = "elixir" })

    -- EditorConfig
    use("editorconfig/editorconfig-vim")

    -- Pretty colours
    use("p00f/nvim-ts-rainbow")
    use({
      "NvChad/nvim-colorizer.lua",
      config = [[require("colorizer").setup()]],
    })

    -- Other stuff
    use({ "junegunn/vim-easy-align", cmd = "EasyAlign" })
    use({ "AndrewRadev/splitjoin.vim", branch = "main" })
    use({ "ck3g/vim-change-hash-syntax", ft = { "ruby", "eruby" } })
    use({
      "nathanaelkane/vim-indent-guides",
      config = function()
        vim.g.indent_guides_auto_colors = true
        vim.g.indent_guides_start_level = 2
        vim.g.indent_guides_guide_size = 1
      end,
    })

    -- Git times
    use({
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("gitsigns").setup()
      end,
    })

    -- Test runner
    use({
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "olimorris/neotest-rspec",
        "haydenmeade/neotest-jest",
      },
      config = function()
        require("neotest").setup({
          adapters = {
            require("neotest-rspec"),
            require("neotest-jest"),
          },
        })
      end,
    })

    -- Vim motions on speed
    use({
      "phaazon/hop.nvim",
      branch = "v2",
      config = function()
        require("hop").setup({})
      end,
    })

    use({
      "tamton-aquib/duck.nvim",
      config = function()
        vim.keymap.set("n", "<leader>dd", function()
          require("duck").hatch()
        end, { desc = "Hatch a duck" })
        vim.keymap.set("n", "<leader>dk", function()
          require("duck").cook()
        end, { desc = "Cook a duck" })
      end,
    })
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
