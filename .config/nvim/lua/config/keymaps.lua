--
-- Keymaps for NeoVim
--

-- Default leader key (set to spacebar)

vim.g.mapleader = " "

-- Keymaps from NeoVim

vim.keymap.set("n", "<leader>s", vim.cmd.so, { desc = "Pre Source File" })

-- Keymaps from Fzf-Lua

vim.keymap.set("n", "<leader>f", function() require('fzf-lua').builtin() end, { desc = "Fzf Commands" })
vim.keymap.set("n", "<leader>ff", function() require('fzf-lua').files() end, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>fg", function() require('fzf-lua').git_files() end, { desc = "Fzf Git Files" })
vim.keymap.set("n", "<leader>fb", function() require('fzf-lua').buffers() end, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>fs", function() require('fzf-lua').grep() end, { desc = "Fzf Grep" })

-- Keymaps from Nvim-tree

vim.keymap.set("n", "<leader>t",function()
	vim.cmd('Oil')
end, { desc = "Pre Source File" })

-- Keymaps from Better-Whitespace

vim.keymap.set('n', ']w', function() vim.cmd('NextTrailingWhitespace') end, { desc = "Next Whitespaces" })
vim.keymap.set('n', '[w', function() vim.cmd('PrevTrailingWhitespace') end, { desc = "Previous Whitespaces" })
vim.keymap.set('n', 'rw', function() vim.cmd('StripWhitespace') end, { desc = "Remove Whitespaces" })

-- Keymaps from Diffview

vim.keymap.set('n', 'df', function() vim.cmd('DiffviewOpen') end, { desc = "Remove Whitespaces" })
