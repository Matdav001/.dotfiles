return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	enabled = true,
	init = false,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		-- Define and set highlight groups for each logo line
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#d1d1d1" }) -- Indigo
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#aeaeae" }) -- Deep Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#8b8b8b" }) -- Deep Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#6b6b6b" }) -- Medium Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#4c4c4c" }) -- Light Purple
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#2f2f2f" }) -- Very Light Purple
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
			dashboard.button("f", " " .. " Find file",       "<cmd> FzfLua files <cr>"),
			dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
			dashboard.button("r", " " .. " Recent files",    "<cmd> FzfLua oldfiles <cr>"),
			dashboard.button("g", " " .. " Find text",       "<cmd> FzfLua live_grep <cr>"),
			dashboard.button("z", " " .. " Open Directories", "<cmd> Oil <cr>"),
			dashboard.button("c", " " .. " Config",          "<cmd> Oil ~/.dotfiles <cr><cmd>lua require('oil.actions').toggle_hidden.callback()<cr>"),
			dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
			dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
		}
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#D2D2D2" }) -- Light Purple
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#4c4c4c" }) -- Greenish
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#D2D2D2" })

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
				dashboard.section.footer.val = {"Startuptime: "
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
