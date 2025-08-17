--
-- Keymaps for NeoVim
--

-- Default leader key (set to spacebar)

vim.g.mapleader = " "

-- Function to set description for Keymaps

local function opts(desc)
	return {desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true}
end

-- Keymaps from NeoVim

vim.keymap.set("n", "<leader>s", vim.cmd.so, { desc = "Pre Source File" })

-- Keymaps from Fzf-Lua

vim.keymap.set("n", "<leader>f", function() require('fzf-lua').builtin() end, { desc = "Fzf Commands" })
vim.keymap.set("n", "<leader>ff", function() require('fzf-lua').files() end, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>fg", function() require('fzf-lua').git_files() end, { desc = "Fzf Git Files" })
vim.keymap.set("n", "<leader>fb", function() require('fzf-lua').buffers() end, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>fs", function() require('fzf-lua').grep() end, { desc = "Fzf Grep" })

-- Keymaps from Nvim-tree

vim.keymap.set("n", "<leader>t", function () require "nvim-tree.api".tree.open() end, { desc = "Pre Source File" })
vim.keymap.set("n", "<leader>ct", function () require "nvim-tree.api".tree.close() end, { desc = "Pre Source File" })
function NvimTreeKeys()
	local treeApi = require("nvim-tree.api")

	vim.keymap.set('n', '<leader><leader>', function ()
		ChangeDir(0, vim.fn.expand("%:h"))
		treeApi.tree.open({find_file = true})
	end, opts('Change-Tree-Dir'))
end

-- Keymaps from Better-Whitespace

vim.keymap.set('n', ']w', function() vim.cmd('NextTrailingWhitespace') end, { desc = "Next Whitespaces" })
vim.keymap.set('n', '[w', function() vim.cmd('PrevTrailingWhitespace') end, { desc = "Previous Whitespaces" })
vim.keymap.set('n', 'rw', function() vim.cmd('StripWhitespace') end, { desc = "Remove Whitespaces" })

-- Keymaps from Diffview

vim.keymap.set('n', 'df', function() vim.cmd('DiffviewOpen') end, { desc = "Remove Whitespaces" })
