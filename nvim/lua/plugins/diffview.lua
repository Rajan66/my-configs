-- plugins/diffview.lua
return {
	"sindrets/diffview.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Set up Diffview plugin options
		require("diffview").setup({
			diff_binaries = false, -- Show diffs for binaries
			enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
			git_cmd = { "git" }, -- The git executable followed by default args.
			hg_cmd = { "hg" }, -- The hg executable followed by default args.
			use_icons = true, -- Requires nvim-web-devicons
			show_help_hints = true, -- Show hints for how to open the help panel
			watch_index = true, -- Update views and index buffers when the git index changes.
			icons = { -- Only applies when use_icons is true.
				folder_closed = "",
				folder_open = "",
			},
			signs = {
				fold_closed = "",
				fold_open = "",
				done = "✓",
			},
			view = {
				-- Configure the layout and behavior of different types of views.
				-- Available layouts:
				--  'diff1_plain'
				--    'diff2_horizontal'
				--    'diff2_vertical'
				--    'diff3_horizontal'
				--    'diff3_vertical'
				--    'diff4_horizontal'
				--    'diff4_vertical'
				default = {
					layout = "diff2_horizontal", -- Layout style for 2-way diffs
					winbar = { enable = true }, -- Enable winbar
				},
			},
			hooks = {
				-- Callback before creating the diffview window
				diffview_pre_open = function()
					-- Custom pre-open behavior here (optional)
				end,
			},
		})

		-- Optionally set a colorscheme for diffview
		-- vim.cmd("colorscheme rose-pine") -- You can uncomment this line to set the color scheme after diffview setup.
	end,
}
