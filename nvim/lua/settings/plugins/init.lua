return {
  "nvim-lua/plenary.nvim",
  "folke/neodev.nvim",
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  "williamboman/mason-lspconfig.nvim",
  "SmiteshP/nvim-navic",

  {
    "tpope/vim-projectionist",
    cmd = { "A", "AS", "AV" },
    version = false,
  },
  {
    "tpope/vim-repeat",
    keys = ".",
    version = false,
  },
  {
    "tpope/vim-fugitive",
    event = "BufReadPre",
    version = false,
  },
  {
    "tpope/vim-rhubarb",
    event = "BufReadPre",
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true,
    },
  },

  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPre",
  },
  {
    "ckolkey/ts-node-action",
    keys = {
      {
        "sj",
        function()
          require("ts-node-action").node_action()
        end,
        mode = { "n" },
        desc = "Trigger node action",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },

  {
    "phaazon/hop.nvim",
    version = "~2.0.0",
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = { snippet_engine = "luasnip" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeFindFile",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },

  {
    "folke/which-key.nvim",
    opts = {
      show_help = false,
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      key_labels = {
        ["<leader>"] = "SPC",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "folke/trouble.nvim",
    config = true,
  },
  {
    "AckslD/nvim-FeMaco.lua",
    config = true,
    cmd = "FeMaco",
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "BufReadPost",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },
  {
    "JManch/sunset.nvim",
    lazy = false,
    opts = {
      -- Edinburgh co-ords
      latitude = 55.943175,
      longitude = -3.208831,
    },
  },
  {
    "kylechui/nvim-surround",
    version = false,
    keys = { { "S", mode = "v" }, "ys", "yS", "cs", "ds" },
    config = true,
  },

  -- Ruby/Rails plugins
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
    cmd = { "A", "AS", "AT", "AV", "Eview", "Emodel", "Econtroller" },
    version = false,
  },
  {
    "tpope/vim-rake",
    ft = "ruby",
    version = false,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  {
    "AckslD/nvim-neoclip.lua",
    config = true,
  },

  {
    "nyngwang/NeoZoom.lua",
    keys = {
      {
        "<leader>nz",
        function()
          require("neo-zoom").neo_zoom()
        end,
        desc = "Toggle NeoZoom window",
        nowait = true,
      },
    },
    config = true,
    opts = {
      exclude_buftypes = { "terminal" },
    },
  },
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  },
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function()
      require("mini.align").setup({})
    end,
  },
  {
    "tamton-aquib/duck.nvim",
    keys = { "<leader>dd", "<leader>dk" },
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch()
      end, { desc = "Hatch a duck" })
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, { desc = "Cook a duck" })
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural replace",
      },
    },
  },
}
