vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup exe_code
    autocmd!
    "Python"
    autocmd FileType python nnoremap <buffer> <localleader>c
                    \ :sp<CR> :term python3 %<CR> :startinsert<CR>
    "HTML"
    autocmd FileType html nnoremap <buffer> <localleader>c
                    \ :sp<CR> :term brave %<CR> :startinsert<CR>
    "Java"
    autocmd FileType java nnoremap <buffer> <localleader>c
                    \ :sp<CR> :term javac %; java -cp %:p:h %:t:r<CR> :startinsert<CR>
    "C"
    autocmd FileType c nnoremap <buffer> <localleader>c
                    \ :sp<CR> :term  g++ -Wall % && ./a.out<CR>:startinsert<CR>
    "C++"
    autocmd FileType cpp nnoremap <buffer> <localleader>c
                    \ :sp<CR> :term  g++ -Wall % && ./a.out<CR>:startinsert<CR>
    "Haskell"
    autocmd FileType haskell nnoremap <buffer> <localleader>c
                    \ :sp<CR> :term  runhaskell %<CR>:startinsert<CR>
    "Rust" 
    autocmd FileType rust nnoremap <buffer> <localleader>c 
                    \ :sp<CR> :term cargo run <CR>:startinsert<CR>

]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
