return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
			end

			-- Keybindings
			map("n", "<leader>a", function()
				harpoon:list():add()
			end, "Harpoon Add File")

			map("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, "Harpoon Toggle Menu")

			-- Quick Nav
			map("n", "<leader>1", function()
				harpoon:list():select(1)
			end, "Harpoon 1")

			map("n", "<leader>2", function()
				harpoon:list():select(2)
			end, "Harpoon 2")

			map("n", "<leader>3", function()
				harpoon:list():select(3)
			end, "Harpoon 3")

			map("n", "<leader>4", function()
				harpoon:list():select(4)
			end, "Harpoon 4")

			map("n", "<C-S-P>", function()
				harpoon:list():prev()
			end, "Harpoon Previous")
			map("n", "<C-S-N>", function()
				harpoon:list():next()
			end, "Harpoon Next")
		end,
	},
}
