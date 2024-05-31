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

function obsidian_new(path)
    local fname = vim.fn.input("File: ", "", "file")
    if fname == "" then
        return
    end
    vim.cmd("ObsidianNew "..path..fname..".md" )
end

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n",  "<A-1>", function() ui.nav_file(1) end)
vim.keymap.set("n",  "<A-2>", function() ui.nav_file(2) end)
vim.keymap.set("n",  "<A-3>", function() ui.nav_file(3) end)
vim.keymap.set("n",  "<A-4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file/find",
      f = { "<cmd>FzfLua files<cr>", "Find File" },
      c = { "<cmd>FzfLua lgrep_curbuf<cr>", "Find Content" },
      a = { "<cmd>FzfLua live_grep<cr>", "Find All Text" },
      b = { "<cmd>FzfLua buffers<cr>", "Find Buffer" },
      e = { "<cmd>Ex<cr>", "Explorer" },
      s = { "<cmd>FzfLua lsp_document_symbols<cr>", "Find Symbols" },
      w = { "<cmd>FzfLua lsp_live_workspace_symbols<cr>", "Find Workspace Symbols" }

    },
    d = {
	    name = "+diagnostics",
	    f = { "<cmd>FzfLua lsp_document_diagnostics<cr>", "Diagnose File" },
	    w = { "<cmd>FzfLua lsp_workspace_diagnostics<cr>", "Diagnose Workspace" }

    },
    g = {
	g = { "<cmd>LazyGit<cr>", "LazyGit" },
	d = { "<cmd>FzfLua lsp_definitions<cr>", "GoTo Definition(s)" },
	r = { "<cmd>FzfLua lsp_references<cr>", "GoTo Reference(s)" }
    },
    c = {
	    a = { "<cmd>FzfLua lsp_code_actions<cr>", "Code Actions" },
	    f = { "<cmd>call Black()<cr>", "Code Foramt" }
    },
    n = {
	    name = "+New",
      	    f = { "<cmd>enew<cr>", "New File" },
    },
    h = {
	    name = "Harpoon",
	    m = { function() mark.add_file() end, "Harpoon Mark File" },
	    t = { function() ui.toggle_quick_menu() end, "Harpoon menu" },
	    
    },
    p = { "<cmd>Telescope projects<cr>", "Recent Projects" },
    o = {
	    name = "+Obsidian",
	    s = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
	    t = { "<cmd>ObsidianTemplate<cr>", "Insert Template" },
	    b = { "<cmd>ObsidianBacklinks<cr>", "View Backlinks" },
	    i = { "<cmd>ObsidianPasteImg<cr>", "Paste Image" },
	    l = { "<cmd>ObsidianLinks<cr>", "View links" },
        n = { function() obsidian_new("+ Encounters/") end, "New Note" },
        c = { function() obsidian_new("Deck/DAT520/") end, "New Flashcard"}
    },
  },
})


return {}
