--
-- Neovim Configs
--

-- Disable default files tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable plugins managed by lazy
require("config.lazy")

-- Enable extras configs
require("config")
