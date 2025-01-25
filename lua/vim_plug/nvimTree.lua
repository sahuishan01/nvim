-- nvim_plug/nvimTree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      view = {
        width = 30,
        side = "right",
      },
    })
  end,
require'nvim-tree'.setup {}
}

