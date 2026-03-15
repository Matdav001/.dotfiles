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

local installedPacks = require("mason-registry").get_installed_packages()
local lspConfigNames = vim.iter(installedPacks):fold({}, function(acc, pack)
	table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
	return acc
end)
vim.lsp.enable(lspConfigNames)
