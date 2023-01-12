-- keymaps
local key_map = vim.api.nvim_set_keymap

-- key_map("n", "jj", "<Esc>", { noremap = false })
key_map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
key_map("n", "<leader>w", ":w<CR>", { noremap = true })
-- key_map("n", "<leader>e", [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
key_map("n", "<leader>e", [[<Cmd>Explore<CR>]], { noremap = true, silent = true })
-- key_map("n", "<leader>j", [[<Cmd>BufferLinePick<CR>]], { noremap = true, silent = true })
-- key_map("n", "<leader>e", [[<Cmd>NERDTreeFocus<CR>]], { noremap = true, silent = true })
key_map("n", "<leader>m", "[[<Cmd>cd %:p:h<CR>:pwd<CR>]]", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- key_map("n", "<leader>{", "ysiW`", { noremap = false })
-- key_map("n", '<leader>"', 'ysiW"', { noremap = false })
-- key_map("n", "<leader>'", "BBYSIw'", { NOREMAP = FALSE })
--
-- disable arrow
vim.cmd([[
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
]])

vim.cmd([[
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
]])
