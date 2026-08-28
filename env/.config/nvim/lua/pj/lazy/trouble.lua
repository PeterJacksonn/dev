return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"]t",
				"<cmd>Trouble diagnostics next jump=true<cr>",
				desc = "Next diagnostic (Trouble)",
			},
			{
				"[t",
				"<cmd>Trouble diagnostics prev jump=true<cr>",
				desc = "Previous diagnostic (Trouble)",
			},
		},
	},
}
