local ls = require("luasnip")
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }


--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
vim.api.nvim_set_keymap("n", "<A-j>", "<Esc>:m .+1<CR>==g", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<Esc>:m .-2<CR>==g", opts)

-- Insert --
-- Press jk fast to exit insert mode 
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "kj", "<ESC>", opts)

--LSP
vim.api.nvim_set_keymap("n", "<C-'>", "Lspsaga term_toggle", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
  vim.api.nvim_set_keymap("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  vim.api.nvim_set_keymap("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  --vim.api.nvim_set_keymap("n", "<leader>lJ", function()
  --require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
--end, opts)
 --vim.api.nvim_set_keymap("n", "<leader>lK", function()
  --require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
--end, opts)
  vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
  vim.api.nvim_set_keymap("n", "<leader>lR", "<cmd>Lspsaga rename ++project<cr>", opts)
  vim.api.nvim_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  vim.api.nvim_set_keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
  vim.api.nvim_set_keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
  vim.api.nvim_set_keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
  vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)


-- Visual --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv<Esc>", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv<Esc>", opts)

-- Terminal --
-- Better terminal navigation
-- vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-N>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-P>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Lua
vim.keymap.set("n", "<leader>rx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>rw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>rd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>rl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>rq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- Open compiler
vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_buf_set_keymap(0, 'n', '<S-F6>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
