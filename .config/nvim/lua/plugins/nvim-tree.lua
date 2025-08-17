return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	keys = {
      { "<leader>m", "", desc = "NeoTree" },
    },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local function my_on_attach(bufnr)
			local api = require ("nvim-tree.api")
			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			NvimTreeKeys()
		end

		function ChangeDir(global, path)
			vim.cmd((global and "cd " or "lcd ") .. vim.fn.fnameescape(path))
		end

		require("nvim-tree").setup {
			sync_root_with_cwd = true,
			hijack_cursor = true,
			view = {
				number = true,
			},
			on_attach = my_on_attach,
		}
	end,
}
