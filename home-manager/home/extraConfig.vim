let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

nnoremap <CR> :nohlsearch<cr>
nnoremap <Leader><Leader> :e#<CR>
nnoremap <Leader>q :q<CR>

set hidden
set history=100

colorscheme gruvbox

" os x copy/paste buffer
set clipboard=unnamed

" line numbers
set number
set relativenumber
set numberwidth=1
set colorcolumn=120

" mouse support
if has("mouse")
  set mouse=a
endif

" indentation
filetype plugin indent on
" set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" whitespace
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" NERDtree
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>g :GFiles?<CR>
nnoremap <Leader>h :History<CR>

command! -bang -nargs=* Rgrep call fzf#vim#grep(s:rgoptions.shellescape(<q-args>), 1, <bang>0)
nnoremap <leader>g :Rgrep<CR>
let s:rgoptions='rg
      \ --column
      \ --line-number
      \ --no-heading
      \ --fixed-strings
      \ --ignore-case
      \ --hidden
      \ --follow
      \ --glob "!.git/*"
      \ --color "always" '

" tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> tt :TestLast<CR>
let test#strategy = 'vimterminal'

nmap <Leader>0 :let g:gitgutter_diff_base = 'HEAD^'<CR>
nmap <Leader>1 :let g:gitgutter_diff_base = 'HEAD^^'<CR>
nmap <Leader>2 :let g:gitgutter_diff_base = 'HEAD^^^'<CR>
nmap <Leader>3 :let g:gitgutter_diff_base = 'HEAD^^^^'<CR>
nmap <Leader>4 :let g:gitgutter_diff_base = 'HEAD^^^^^'<CR>
nmap <Leader>5 :let g:gitgutter_diff_base = 'HEAD^^^^^^'<CR>
nmap <Leader>6 :let g:gitgutter_diff_base = 'HEAD^^^^^^^'<CR>
nmap <Leader>7 :let g:gitgutter_diff_base = 'HEAD^^^^^^^^'<CR>
nmap <Leader>8 :let g:gitgutter_diff_base = 'HEAD^^^^^^^^^'<CR>
nmap <Leader>9 :let g:gitgutter_diff_base = 'HEAD^^^^^^^^^^'<CR>
