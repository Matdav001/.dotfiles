return  {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function ()
		require('lualine').setup {
			options = {
				theme = "ayu_mirage",
				disabled_filetypes = {
					statusline = {
					},
					winbar = {
						"NvimTree"
					},
					"alpha",
					"fzf",
					'lazy'
				},
				globalstatus = true
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {
					{'filename',
						symbols = {
							modified = '●',
							readonly = '',
							unnamed =  '',
							newfile = '',
						},
					}
				},
				lualine_x = {'encoding'},
				lualine_y = {'progress', 'location'},
				lualine_z = {
					{'fileformat',
						symbols = {
							unix = ' '
						},
					}
				}
			},
			winbar = {
				lualine_a = {'filetype'},
				lualine_b = {'diagnostics'},
				lualine_z = {
					{'filename',
						symbols = {
							modified = '●',
							readonly = '',
							unnamed =  '',
							newfile = '',
						},
					}

				},
			},
			inactive_winbar = {
				lualine_a = {'filetype'},
				lualine_b = {'diagnostics'},
				lualine_z = {
					{'filename',
						symbols = {
							modified = '●',
							readonly = '',
							unnamed =  '',
							newfile = '',
						},
					}
				},
			}
		}
	end
}
