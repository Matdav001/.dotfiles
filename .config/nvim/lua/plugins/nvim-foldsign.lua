return {
	"yaocccc/nvim-foldsign",
	opts = {
		offset = -2,
		foldsigns = {
			open = '-', -- mark the beginning of a fold
			close = '+', -- show a closed fold
			seps = { '│', '┃' }, -- open fold middle marker
		},
		enabled = true,
	},
}
