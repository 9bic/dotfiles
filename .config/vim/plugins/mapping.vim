" Tags
nnoremap <silent> <Leader>t :Vista!!<CR>

" Fazy-finder
noremap <silent> <Leader><Leader> <Cmd>Ddu<CR>
noremap <silent> <Leader>fi <Cmd>Ddu file_rec<CR>
noremap <silent> <Leader>fm <Cmd>Ddu mr<CR>
noremap <silent> <Leader>g <Cmd>DduRg<CR>

" Filer
nnoremap <silent> <Leader>n :Fern . -reveal=% -drawer -toggle -width=40<CR>

" Completion
inoremap <C-n> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
