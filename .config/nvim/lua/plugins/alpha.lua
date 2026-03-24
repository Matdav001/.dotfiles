return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	enabled = true,
	init = false,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local c = require("themes.myNvim").colors

		-- Define and set highlight groups for each logo line
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = c.gray11 })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = c.gray10 })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = c.gray9 })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = c.gray8 })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = c.gray7 })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = c.gray6 })
		dashboard.section.header.type = "group"
		dashboard.section.header.val = {
			{
				type = "padding",
				val = 1,
			},
			{
				type = "text",
				val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
			},
			{
				type = "text",
				val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
			},
			{
				type = "padding",
				val = 1,
			},
		}
		-- stylua: ignore
		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", "<cmd> FzfLua files <cr>"),
			dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			dashboard.button("r", " " .. " Recent files", "<cmd> FzfLua oldfiles <cr>"),
			dashboard.button("g", " " .. " Find text", "<cmd> FzfLua live_grep <cr>"),
			dashboard.button("z", " " .. " Open Directories", "<cmd> Oil <cr>"),
			dashboard.button("c", " " .. " Config",
				"<cmd> Oil ~/.dotfiles <cr><cmd>lua require('oil.actions').toggle_hidden.callback()<cr>"),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
		}
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = c.gray10 })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = c.gray6 })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = c.gray10 })

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 3
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "VeryLazy",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = { "Startuptime: "
				.. ms
				.. " || Plugins: "
				.. stats.loaded
				.. " / "
				.. stats.count
				}
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
