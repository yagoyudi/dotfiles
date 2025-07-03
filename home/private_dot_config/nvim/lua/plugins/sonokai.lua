-- Colorscheme

return {
  {
    'sainnhe/sonokai',
    -- Make sure to load this before all the other start plugins:
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'sonokai'
    end,

    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_better_performance = 1
    end,
  },
}
