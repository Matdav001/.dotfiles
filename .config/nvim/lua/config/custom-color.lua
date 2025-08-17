--
-- Custom colors for neovim
--

vim.api.nvim_set_hl(0, "NonText", {fg = "#141414", background = "#141414"})
vim.api.nvim_set_hl(0, "Normal", {fg = "#D2D2D2", bg = "#141414"})

vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", {fg = "#D2D2D2"})
vim.api.nvim_set_hl(0, "RenderMarkdownChecked", {fg = "#D2D2D2"})
vim.api.nvim_set_hl(0, "RenderMarkdownDash", {fg = "#D24646", bold = true})
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", {fg = "#141414", bg = "#D2D2D2", bold = true})


-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#323232", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#D2D2D2", bg = "#464646" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#78E1D2", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#78E1D2", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#D2D2D2", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#FF9632", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#FF9632", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#FF9632", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#BBBBBB", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#BBBBBB", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#BBBBBB", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#E196E1", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#E196E1", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#E196E1", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#D200D2", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#D200D2", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#D2D232", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#D2D232", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#D2D232", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#5096D2", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#5096D2", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D2D2D2", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#D2D2D2", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#D2D2D2", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#46D246", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#46D246", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#46D246", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#E14600", bg = "NONE"})
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#E14600", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#E14600", bg = "NONE" })
