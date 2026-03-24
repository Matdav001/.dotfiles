local c = require("themes.myNvim").colors

vim.api.nvim_set_hl(0, "myNvim.Red", { fg = c.red })
vim.api.nvim_set_hl(0, "myNvim.Orange", { fg = c.orange })
vim.api.nvim_set_hl(0, "myNvim.Yellow", { fg = c.yellow })
vim.api.nvim_set_hl(0, "myNvim.Green", { fg = c.green })
vim.api.nvim_set_hl(0, "myNvim.Purple", { fg = c.purple })

return {
	'saghen/blink.indent',
	--- @module 'blink.indent'
	--- @type blink.indent.Config
	opts = {
		static = {
			enabled = true,
			char = '▎',
			whitespace_char = nil,
			priority = 1,
			highlights = { 'BlinkIndent' },
		},
		scope = {
			enabled = true,
			char = '▎',
			priority = 1000,
			highlights = {
				"myNvim.Red",
				"myNvim.Orange",
				"myNvim.Yellow",
				"myNvim.Green",
				"myNvim.Purple"
			},
		},
	},
}
