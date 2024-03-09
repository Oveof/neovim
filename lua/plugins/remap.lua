vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
local wk = require("which-key")
local trouble = require("trouble")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
      e = { "<cmd>Ex<cr>", "Explorer" },
      a = { function() mark.add_file() end, "Harpoon Mark File" },
      h = { function() ui.toggle_quick_menu() end, "Harpoon menu" },

    },
    d = {
	    name = "+diagnostics",
	    t = {trouble.toggle(), "Open Trouble"}
    },
    g = {
	name = "+git",
	g = { "<cmd>LazyGit<cr>", "LazyGit" },
    },
    {
    a = {
	name = "+aerial",
	a = { "<cmd>AerialToggle<cr>", "Toggle Aerial View" }

    }
    }
  },
})


return {}
