return {
	"nvim-orgmode/telescope-orgmode.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-orgmode/orgmode",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("orgmode")

		local ext = require("telescope").extensions.orgmode
		vim.keymap.set("n", "<leader>fh", ext.search_headings, { desc = "Org headlines" })
		vim.keymap.set("n", "<leader>ft", ext.search_tags, { desc = "Org tags" })
		vim.keymap.set("n", "<leader>r", ext.refile_heading, { desc = "Org refile" })
		vim.keymap.set("n", "<leader>li", ext.insert_link, { desc = "Org insert link" })
	end,
}
