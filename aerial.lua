require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "n", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "p", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})

return {}
