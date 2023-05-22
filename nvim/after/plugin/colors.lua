function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	if color == "rose-pine" then
		require('rose-pine').setup({
			--- @usage 'main' | 'moon'
			disable_italics = true
		})
	end
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

-- why need to call it two times to work for disable_italics?
ColorMyPencils()
ColorMyPencils()
