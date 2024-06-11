:set number
:set relativenumber
:set autoindent smartindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
set clipboard+=unnamedplus
:set mouse=a
set encoding=UTF-8

call plug#begin("$HOME/.config/nvim/vim-plug")

Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/xiyaowong/transparent.nvim'

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-e> :Lexplore<CR>

nnoremap <C-u> :undo<CR>
nnoremap <C-r> :redo<CR>

nnoremap <C-s> :w<CR>
nnoremap <S-w> :q<CR>
nnoremap <S-q> :q!<CR>
nnoremap <S-t> :tabnew<CR>
nnoremap <S-f> ?
nnoremap <C-c> yy
nnoremap <C-x> dd
nnoremap <C-v> p
nnoremap <S-s> :sp<CR>
nnoremap <S-d> :vs<CR>
nnoremap <C-h> <C-w>b

function! OpenTerm()
	execute "split"
	:terminal!
endfunction

nmap <F5> :terminal<CR> i
nmap <S-e> :call OpenTerm()<CR> i

:imap <C-BS> <C-w>

:colorscheme onedark

:set completeopt-=preview

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Install Coc Langs
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
inoremap <C-Del> <C-w>
inoremap <C-H> <C-w>
inoremap <C-c> y
inoremap <C-x> d
inoremap <C-v> p

lua << EOF
require("nvim-autopairs").setup {}
EOF
