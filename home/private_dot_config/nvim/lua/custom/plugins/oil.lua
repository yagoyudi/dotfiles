
return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    config = function()
      require"oil".setup{
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set("n", "-", "<cmd>Oil<cr>")
    end,
  }
}
