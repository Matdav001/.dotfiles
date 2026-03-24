return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local c = require("themes.myNvim").colors
		local myNvim = {
			normal = {
				a = { fg = c.black, bg = c.blue },
				b = { fg = c.fg, bg = c.gray },
				c = { fg = c.fg, bg = c.bg_dark },
			},

			insert = { a = { fg = c.black, bg = c.green } },
			visual = { a = { fg = c.black, bg = c.purple } },
			replace = { a = { fg = c.black, bg = c.red } },

			inactive = {
				a = { fg = c.white, bg = c.black },
				b = { fg = c.white, bg = c.black },
				c = { fg = c.white, bg = c.black },
			},
		}

		-- Setup
		require('lualine').setup {
			options = {
				theme = myNvim,
				disabled_filetypes = {
					statusline = {
					},
					winbar = {
						"NvimTree",
						"DiffviewFiles"
					},
					"alpha",
					"fzf",
					'lazy'
				},
				globalstatus = true,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode',
						separator = {
							left = '',
							right = ''
						},
					}
				},
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = {
					{ 'filename',
						symbols = {
							modified = '●',
							readonly = '',
							unnamed = '',
							newfile = '',
						},
					}
				},
				lualine_x = {
					'encoding',
					function()
						return vim.b.neocodeium_status or ""
					end,
				},
				lualine_y = { 'progress', 'location' },
				lualine_z = {
					{ 'fileformat',
						symbols = {
							unix = ' '
						},
						separator = {
							left = '',
							right = ''
						},

					}
				}
			},
			winbar = {
				lualine_a = {
					{ 'filetype',
						separator = {
							left = '',
							right = ''
						},
					}
				},
				lualine_b = { 'diagnostics' },
				lualine_z = {
					{ 'filename',
						symbols = {
							modified = '●',
							readonly = '',
							unnamed = '',
							newfile = '',
						},
						separator = {
							left = '',
							right = ''
						},
					}

				},
			},
			inactive_winbar = {
				lualine_a = { 'filetype' },
				lualine_b = { 'diagnostics' },
				lualine_z = {
					{ 'filename',
						symbols = {
							modified = '●',
							readonly = '',
							unnamed = '',
							newfile = '',
						},
					},
				},
			}
		}
	end
}
