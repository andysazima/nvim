--[[
Name: Nvim Treesitter
Language: N/A
Description: Better syntax highlighting with treesitter
--]]
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"MeanderingProgrammer/treesitter-modules.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	branch = "main",
	build = ":TSUpdate",
	-- 	opts = {
	-- ensure_installed = {
	-- "bash",
	-- "cpp",
	-- -- "latex",
	-- "lua",
	-- "luadoc",
	-- "html",
	-- "json",
	-- "markdown",
	-- "markdown_inline",
	-- "python",
	-- "regex",
	-- "rust",
	-- "toml",
	-- "typst",
	-- "vim",
	-- "vimdoc",
	-- "yaml",
	-- },
	-- ignore_install = {
	-- "man",
	-- },
	-- indent = { enable = true },
	-- highlight = {
	-- enable = true,
	-- },
	-- },
	-- config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
	config = function()
		-- vim.treesitter.language.register("c_sharp", { "csharp", "c_sharp" })

		local languages = {
			"bash",
			"cpp",
			"latex",
			"lua",
			"luadoc",
			"html",
			"json",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"rust",
			"toml",
			"typst",
			"vim",
			"vimdoc",
			"yaml",
		}

		-- Covers ensure_installed + highlight + indent + fold + incremental selection
		local ts = require("treesitter-modules")
		ts.setup({
			ensure_installed = languages,
			ignore_install = {},
			sync_install = true,
			auto_install = true,

			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			fold = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})

		-- Fold settings
		-- vim.opt.foldmethod = "expr"
		-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		-- autotag
		require("nvim-ts-autotag").setup()

		-- textobjects plugin now uses its own setup + keymaps
		require("nvim-treesitter-textobjects").setup({
			move = {
				set_jumps = false,
			},
			select = {
				lookahead = true,
			},
		})
	end,
}
