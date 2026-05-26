local S = function()
	return require("snacks")
end
return {
	"folke/snacks.nvim",

	opts = {
		picker = {
			enabled = true,
			-- layout = "sidebar",
			-- layout = "select",
		},
		explorer = { enabled = true },
	},

	keys = {
		-- Top Pickers
		{
			"<leader>,",
			function()
				S().picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				S().picker.grep()
			end,
			desc = "Grep",
		},

		-- Code actions
		{
			"<leader>ca",
			function()
				S().lsp.actions()
			end,
			desc = "Code Actions",
			mode = { "n", "v" },
		},

		--------------------------------------------------
		-- Find
		--------------------------------------------------

		{
			"<leader>fb",
			function()
				S().picker.buffers()
			end,
			desc = "Buffers",
		},

		{
			"<leader>fc",
			function()
				S().picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},

		{
			"<leader>ff",
			function()
				S().picker.files()
			end,
			desc = "Find Files",
		},

		--------------------------------------------------
		-- Git
		--------------------------------------------------

		-- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
		{
			"<leader>gl",
			function()
				S().picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				S().picker.git_stash()
			end,
			desc = "Git Stash",
		},
		-- {
		-- 	"<leader>gd",
		-- 	function()
		-- 		Snacks.picker.git_diff()
		-- 	end,
		-- 	desc = "Git Diff Hunks",
		-- },

		--------------------------------------------------
		-- Grep
		--------------------------------------------------

		{
			"<leader>sb",
			function()
				S().picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				S().picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				S().picker.grep()
			end,
			desc = "Grep Project",
		},

		--------------------------------------------------
		-- LSP Navigation
		--------------------------------------------------

		{
			"gd",
			function()
				S().picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				S().picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				S().picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				S().picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},

		--------------------------------------------------
		-- LSP Search
		--------------------------------------------------

		{
			"<leader>sD",
			function()
				S().picker.diagnostics_buffer()
			end,
			desc = "Diagnostics (buffer)",
		},
	},
}
