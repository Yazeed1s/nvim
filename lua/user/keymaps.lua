-- keymaps
local key_map = vim.api.nvim_set_keymap

-- key_map("n", "jj", "<Esc>", { noremap = false })
-- quit (or close window)
key_map("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })
-- write
key_map("n", "<Leader>w", ":w<CR>", { noremap = true })
-- run packer sync
key_map("n", "<leader>e", [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
-- key_map("n", "<leader>e", [[<Cmd>NERDTreeFocus<CR>]], { noremap = true, silent = true })
key_map("n", "<leader>m", "[[<Cmd>cd %:p:h<CR>:pwd<CR>]]", { noremap = true, silent = true })

-- Surround word under cursor w/ backticks (required vim-surround)
--
-- key_map("n", "<leader>{", "ysiW`", { noremap = false })
-- Surround word under cursor w/ double quotes (required vim-surround)
-- key_map("n", '<leader>"', 'ysiW"', { noremap = false })
-- Surround word under cursor w/ single quotes (required vim-surround)
-- key_map("n", "<leader>'", "ysiW'", { noremap = false })
