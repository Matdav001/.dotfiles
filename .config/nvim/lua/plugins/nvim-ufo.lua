return {
	'kevinhwang91/nvim-ufo',
	dependencies = { 'kevinhwang91/promise-async' },
	opts = {},
	config = function(_, opts)
		vim.o.foldlevelstart = 99
	end
}
