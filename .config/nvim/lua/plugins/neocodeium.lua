return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require('neocodeium')
		local blink = require('blink.cmp')

		vim.api.nvim_create_autocmd('User', {
			pattern = 'BlinkCmpMenuOpen',
			callback = function()
				neocodeium.clear()
			end,
		})

		neocodeium.setup({
			filter = function()
				return not blink.is_visible()
			end,
			silent = true,
		})

		local function get_neocodeium_status()
			local status = neocodeium.get_status()

			if status == 0 then
				vim.b.neocodeium_status = " "
			else
				vim.b.neocodeium_status = " "
			end

			require("lualine").refresh()
		end

		local group = vim.api.nvim_create_augroup("NeoCodeiumStatus", { clear = true })

		-- 🔹 NeoCodeium events
		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = {
				"NeoCodeiumServer*",
				"NeoCodeium*Enabled",
				"NeoCodeium*Disabled",
			},
			callback = get_neocodeium_status,
		})

		-- 🔹 Buffer change
		vim.api.nvim_create_autocmd("BufEnter", {
			group = group,
			callback = get_neocodeium_status,
		})
	end,
}
