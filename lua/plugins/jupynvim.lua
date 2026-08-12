--[[
Name: Jupynvim
Language: ipynb
Description: Jupyter Notebooks in Nvim
--]]
return {
	"sheng-tse/jupynvim",
	build = function(plugin)
		local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
		install.run(plugin)
	end,
	opts = {
		log_level = "info",
		image_renderer = "chafa", -- "placeholder", "kitty", or "chafa"
		keymaps = {
			enter_output_dn = false,
			enter_output_up = false,
		},
		explorer_keys = {},
		terminal_keys = {},
		pick_keys = {
			files = {},
			grep = {},
		},
	},
}

