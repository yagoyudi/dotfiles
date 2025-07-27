return {
	'stevearc/oil.nvim',
	opts = {},

	-- Lazy loading is not recommended because it is very tricky to make it
	-- work correctly in all situations.
	lazy = false,

	config = function()
		require("oil").setup({
			columns = {}, -- Remove icons
			view_options = {
				show_hidden = true,
			},
			vim.keymap.set("n", "-", "<cmd>Oil<cr>")
		})
	end,
}
