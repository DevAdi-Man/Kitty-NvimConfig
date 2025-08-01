-- Set leader key to space
vim.g.mapleader = " "

-- Disable arrow keys in normal mode
vim.api.nvim_set_keymap('n', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '', { noremap = true, silent = true })

-- Disable arrow keys in insert mode
vim.api.nvim_set_keymap('i', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '', { noremap = true, silent = true })

-- File explorer command
vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("silent! lua vim.cmd('e .')")
end, { desc = "open default NetRW manually" })

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor after joining lines and scrolling
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LSP restart keybinding
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Delete and paste in visual mode without affecting register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without affecting register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Escape in insert mode with Ctrl+C
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q key
vim.keymap.set("n", "Q", "<nop>")

-- Open tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer <CR>")

-- LSP format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate diagnostics and location list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Start CellularAutomaton effect
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton scramble<CR>")

--[  uncomment for format and save at same time
--vim.keymap.set("n", "<leader>ss", function()
--  vim.lsp.buf.format()
--  vim.cmd("w")
--end, { desc = "Format the file and save" })
--]

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)


