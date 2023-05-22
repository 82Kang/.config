-- These are power remaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- select moves
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join line keeps the cursor on the same line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")
vim.keymap.set("n", "<C-f>","<C-f>zz")
vim.keymap.set("n", "<C-b>","<C-b>zz")
vim.keymap.set("n", "n","nzzzv")
vim.keymap.set("n", "N","Nzzzv")

-- remap so that copied text remains in the register
-- even after copy making use of void register

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("x", "<leader>d", "\"_d")


-- make copy to clipboard easier
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- sacrificing <C-f> for tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

-- sacrificing <C-k> window movement, for quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- remapping for tabbed navigation
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')

-- Move to previous/next tab
vim.keymap.set('n', '<A-,>', '<Cmd>tabprevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>tabnext<CR>')
-- Re-order to previous/next tab
vim.keymap.set('n', '<A-<>', '<Cmd>tabmove -1<CR>')
vim.keymap.set('n', '<A->>', '<Cmd>tabmove +1<CR>')
-- open close tab
vim.keymap.set('n', '<A-n>', '<Cmd>tabnew<CR>')
vim.keymap.set('n', '<A-c>', '<Cmd>tabclose<CR>')
