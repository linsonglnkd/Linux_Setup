syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Use CTRL-V to input the special characters
" ^[ -- ESC
" ^M -- Newline
map <F12> ^[I  ^[
map <F11> ^[:syntax off^M
map <F10> ^[^[:set background=dark^M

" LI specific
" Add .pig file for syntac processing
" add the pig.vim in ~/.vim/syntax
augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END
