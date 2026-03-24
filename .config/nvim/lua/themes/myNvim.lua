local M = {}

M.colors = {
	bg      = "#141414",
	bg_dark = "#2e3440",
	fg      = "#c8d3f5",
	muted   = "#6b7089",
	blue    = "#5e81ac",
	cyan    = "#81a1c1",
	green   = "#a3be8c",
	yellow  = "#ebcb8b",
	orange  = "#d08770",
	red     = "#bf616a",
	purple  = "#b48ead",
	black   = "#202020",
	gray    = "#4c566a",
	white   = "#eceff4",
	gray1   = "#2e3440",
	gray2   = "#353c49",
	gray3   = "#3b4252",
	gray4   = "#424a5c",
	gray5   = "#4a5366",
	gray6   = "#545e73",
	gray7   = "#6a7286",
	gray8   = "#8c95a5",
	gray9   = "#b1bac8",
	gray10  = "#d8dee9",
	gray11  = "#eceff4",
}

function M.setup()
	vim.cmd("highlight clear")
	vim.o.termguicolors = true

	-- 🎨 Palette

	local c = M.colors

	-- 🧱 UI
	vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
	vim.api.nvim_set_hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1d2a" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = c.muted })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.fg, bold = true })

	vim.api.nvim_set_hl(0, "Visual", { bg = "#2a2f45" })
	vim.api.nvim_set_hl(0, "Search", { fg = c.bg, bg = c.yellow })

	-- 💬 Syntax (classic)
	vim.api.nvim_set_hl(0, "Comment", { fg = c.muted, italic = true })
	vim.api.nvim_set_hl(0, "Keyword", { fg = c.purple, italic = true })
	vim.api.nvim_set_hl(0, "String", { fg = c.green })
	vim.api.nvim_set_hl(0, "Function", { fg = c.blue })
	vim.api.nvim_set_hl(0, "Identifier", { fg = c.cyan })
	vim.api.nvim_set_hl(0, "Type", { fg = c.yellow })
	vim.api.nvim_set_hl(0, "Error", { fg = c.red, bold = true })

	-- 🌲 Treesitter (IMPORTANT for colorful-menu)
	vim.api.nvim_set_hl(0, "@keyword", { fg = c.purple })
	vim.api.nvim_set_hl(0, "@string", { fg = c.green })
	vim.api.nvim_set_hl(0, "@function", { fg = c.blue })
	vim.api.nvim_set_hl(0, "@variable", { fg = c.fg })
	vim.api.nvim_set_hl(0, "@type", { fg = c.yellow })
	vim.api.nvim_set_hl(0, "@property", { fg = c.cyan })

	-- ⚡ LSP semantic tokens (extra polish)
	vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = c.blue })
	vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = c.fg })
	vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = c.orange })

	-- 📦 Completion menu (blink.cmp)
	vim.api.nvim_set_hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2f45" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3b4261", bg = c.bg_dark })

	-- StatusLine
	vim.api.nvim_set_hl(0, "StatusLine", { bg = c.bg, fg = c.fg })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = c.bg, fg = c.muted })

	-- blink specific (optional but nice)
	vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = c.bg_dark })
	vim.api.nvim_set_hl(0, "BlinkCmpSelection", { bg = "#2a2f45" })
end

return M
