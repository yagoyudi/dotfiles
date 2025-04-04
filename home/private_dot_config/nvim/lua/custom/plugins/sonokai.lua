return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'sainnhe/sonokai',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'sonokai'
    end,

    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_better_performance = 1
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
