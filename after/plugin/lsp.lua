local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- lsp_zero.default_keymaps({buffer = bufnr})
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>cts", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>ctr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end)

lsp_config.sourcekit.setup({
	filetypes = { "swift", "objective-c", "objective-cpp" }
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'tsserver', 'rust_analyzer' },
	handlers = {
		lsp_zero.default_setup,
	},
})

lsp_zero.setup_servers({'lua_ls', 'rust_analyzer'})

lsp_config.tsserver.setup{ filetypes={ "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", 'svelte' } }

lsp_config.svelte.setup{ filetypes={'svelte'} }
