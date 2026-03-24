--
-- Keymaps for NeoVim
--

-- Default leader key (set to spacebar)

vim.g.mapleader = ' '

-- Keymaps from NeoVim

vim.keymap.set('n', '<leader>s', vim.cmd.so, { desc = 'Pre Source File' })

-- Keymaps from Fzf-Lua

vim.keymap.set('n', '<leader>f', function() require('fzf-lua').builtin() end, { desc = 'Fzf Commands' })
vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').files() end, { desc = 'Fzf Files' })
vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').git_files() end, { desc = 'Fzf Git Files' })
vim.keymap.set('n', '<leader>fb', function() require('fzf-lua').buffers() end, { desc = 'Fzf Buffers' })
vim.keymap.set('n', '<leader>fs', function() require('fzf-lua').grep() end, { desc = 'Fzf Grep' })

-- Keymaps from Nvim-tree

vim.keymap.set('n', '<leader>t', function()
	vim.cmd('Oil')
end, { desc = 'Pre Source File' })

-- Keymaps from Better-Whitespace

vim.keymap.set('n', ']w', function() vim.cmd('NextTrailingWhitespace') end, { desc = 'Next Whitespaces' })
vim.keymap.set('n', '[w', function() vim.cmd('PrevTrailingWhitespace') end, { desc = 'Previous Whitespaces' })
vim.keymap.set('n', 'rw', function() vim.cmd('StripWhitespace') end, { desc = 'Remove Whitespaces' })

-- Keymaps from Diffview

vim.keymap.set('n', 'df', function() vim.cmd('DiffviewOpen') end, { desc = 'Remove Whitespaces' })
vim.keymap.set('n', 'dc', function() vim.cmd('DiffviewClose') end, { desc = 'Remove Whitespaces' })

-- Keymaps from Neocodeium helper

local neocodeium = require('neocodeium')
vim.keymap.set('i', '<Tab>', function()
	if neocodeium.visible() then
		neocodeium.accept()
		return ''
	else
		return '<Tab>'
	end
end, { expr = true })
vim.keymap.set('i', '<C-Right>', function()
	return neocodeium.visible() and neocodeium.accept_word() or '<C-Right>'
end, { expr = true })
vim.keymap.set('i', '<C-n>', function()
	return neocodeium.visible() and neocodeium.cycle(1) or '<C-n>'
end, { expr = false })
vim.keymap.set('i', '<C-p>', function()
	return neocodeium.visible() and neocodeium.cycle(-1) or '<C-p>'
end, { expr = false })

-- Keymaps from Runner

local runner = require('runner-nvim')
vim.keymap.set('n', 'rr', function() runner.runLast() end, { desc = 'Remove Whitespaces' })
vim.keymap.set('n', 'rc', function() runner.run() end, { desc = 'Remove Whitespaces' })
vim.keymap.set('n', 'rt', function() runner.toggle() end, { desc = 'Remove Whitespaces' })

-- Keymaps from Flash

local flash = require('flash')
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() flash.jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() flash.treesitter() end, { desc = 'Flash' })
vim.keymap.set({ 'o' }, 'r', function() flash.remote() end, { desc = 'Flash' })
vim.keymap.set({ 'x', 'o' }, 'R', function() flash.treesitter_search() end, { desc = 'Flash' })
vim.keymap.set({ 'c' }, '<C-s>', function() flash.toggle() end, { desc = 'Flash' })

-- Keymaps from SpeelCheck
local langs = { "en_us", "pt_br" }
vim.keymap.set("n", "<leader>ll", function()
	local current = vim.opt.spelllang:get()[1]
	local next_index = 1

	for i, lang in ipairs(langs) do
		if lang == current then
			next_index = i % #langs + 1
			break
		end
	end
	vim.opt.spelllang = langs[next_index]
	print("Spell language: " .. langs[next_index])
end, { desc = "Cycle spell language" })

-- Keymaps from nvimUfo

local ufo = require('ufo')
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
