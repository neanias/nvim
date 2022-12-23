return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  version = "~3.1.0",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
  end,
}
