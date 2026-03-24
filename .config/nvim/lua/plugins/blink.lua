return {
	'saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
		"xzbdmw/colorful-menu.nvim",
	},
	version = '1.*',
	opts = {
		keymap = { preset = 'default' },
		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = {
			keyword = {
				range = "full"
			},
			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= 'default'
				end,
				draw = {
					-- We don't need label_description now because label and label_description are already
					-- combined together in label by colorful-menu.nvim.
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true
			}
		},

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			per_filetype = {
				org = { 'orgmode' }
			},
			providers = {
				orgmode = {
					name = 'Orgmode',
					module = 'orgmode.org.autocompletion.blink',
					fallbacks = { 'buffer' },
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
