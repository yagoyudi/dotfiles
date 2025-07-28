-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.nvim', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

local deps = require('mini.deps')
deps.setup()
deps.add({ source = 'stevearc/oil.nvim' })
deps.add({ source = 'nvim-treesitter/nvim-treesitter' })
deps.add({ source = 'neovim/nvim-lspconfig' })
deps.add({ source = 'mfussenegger/nvim-lint' })

-- Oil:
local oil = require('oil')
oil.setup({
	-- Remove icons:
	colums = {},
	-- Show hidden files:
	view_options = {
		show_hidden = true,
	},
})

-- Pick:
local pick = require('mini.pick')
pick.setup({
	tool = 'rg',
	source = {
		show = pick.default_show,
	},
})

-- Pairs:
require('mini.pairs').setup()

-- Around/Inside:
require('mini.ai').setup({
	n_lines = 500,
})

-- Surround:
require('mini.surround').setup()

-- Statusline:
local statusline = require('mini.statusline')
statusline.setup({
	use_icons = false,
})
statusline.section_location = function()
	return '%2l:%-2v'
end

-- LSP:
vim.lsp.enable({
	'gopls',
	'lua_ls',
})

-- Golang LSP config:
vim.lsp.config('gopls', {
	settings = {
		gopls = {
			analyses ={
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		}
	}
})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				-- Make lua_ls recognize the vim global:
				globals = {
					'vim',
				},
			},
		},
	},
})

-- Golang import and format:
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = {only = {"source.organizeImports"}}
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({async = false})
	end
})

-- LSP Autocompletion:
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd('set completeopt+=noselect')

-- LSP Diagnostic:
vim.diagnostic.config {
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = 'E',
			[vim.diagnostic.severity.WARN] = 'W',
			[vim.diagnostic.severity.INFO] = 'I',
			[vim.diagnostic.severity.HINT] = 'H',
		},
	},
	virtual_text = {
		source = 'if_many',
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
}

-- TreeSitter:
require('nvim-treesitter.configs').setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

-- Linter:
local lint = require('lint')
lint.linters_by_ft = {
	markdown = { 'markdownlint-cli2' },
	go = { 'golangcilint' },
}
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
	group = lint_augroup,
	callback = function()
		-- Only run the linter in buffers that you can modify in order to
		-- avoid superfluous noise, notably within the handy LSP pop-ups that
		-- describe the hovered symbol using Markdown.
		if vim.bo.modifiable then
			lint.try_lint()
		end
	end,
})

-- YamlFmt:
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.yaml,*.yml",
	callback = function()
		vim.cmd("silent! %!yamlfmt /dev/stdin")
	end,
})
