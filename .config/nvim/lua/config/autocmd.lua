--vim.api.nvim_create_autocmd("User", {
--	once = true,
--	pattern = "UIEnter",
--	callback = function()
--		vim.api.nvim_set_var("laststatus",0)
--	end,
--})
local function on_buffer_close()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname:find("vifm: edit") then
		vim.schedule(function()
			-- "only" is the vim command to close all other windows
			-- pcall prevents errors if it's already the only window
			pcall(vim.cmd, "only")

			print("Vifm closed. Maximized current window.")
		end)
	end
end

-- Set up an autocmd group and listener
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
	pattern = {"*"},
	callback = on_buffer_close,
})
