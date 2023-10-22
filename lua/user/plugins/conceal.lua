local opts = { noremap = true, silent = true }

vim.keymap.set("n",  "<F10>" , function()
	if vim.o.conceallevel > 0 then
		vim.o.conceallevel = 0
	else
		vim.o.conceallevel = 2
	end
end, opts)

vim.keymap.set("n",  "<F11>" , function()
	if vim.o.concealcursor == "n" then
		vim.o.concealcursor = ""
	else
		vim.o.concealcursor = "n"
	end
end, opts)
