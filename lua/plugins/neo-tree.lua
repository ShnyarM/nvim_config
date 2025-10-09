-- file system
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons" 
  },
  config=function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items={
          visible = false,
          hide_dotfiles = false,
          hide_by_name = {
            ".git"
          },
          hide_by_pattern = {
            "*.o"
          }
        }
      }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>')
  end
}
