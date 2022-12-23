local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
    "p00f/nvim-ts-rainbow",
  },
}

function M.config()
  local ts_config = require("nvim-treesitter.configs")

  -- Use Treesitter for fold markers
  vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])

  ts_config.setup({
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "eex",
      "elixir",
      "embedded_template",
      "heex",
      "help",
      "html",
      "javascript",
      "json",
      "json5",
      "lua",
      "markdown",
      "python",
      "query",
      "regex",
      "ruby",
      "rust",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    ignore_install = {}, -- List of parsers to ignore installing
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {}, -- list of language that will be disabled
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "<Tab>",
        node_decremental = "<S-Tab>",
      },
    },
    playground = {
      enable = true,
    },
    query_linter = {
      enable = true,
    },
    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
    rainbow = {
      enable = true,
      extended_mode = true,
    },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ar"] = "@block.outer",
          ["ir"] = "@block.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  })
end

return M