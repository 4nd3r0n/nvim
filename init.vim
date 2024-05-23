" NeoVim Config

" Configuración Básica de NeoVim
" Numeración de las líneas
:set number
:set relativenumber

" Sangría automática
:set autoindent smartindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4

" Compatibilidad con el ratón
:set mouse=a

set clipboard+=unnamedplus

" Codificación establecida en UTF-8
set encoding=UTF-8

" Gestión de Plugins
call plug#begin("$HOME/.config/nvim/vim-plug")

Plug 'http://github.com/tpope/vim-surround'				" Facilitar la selección de texto.
Plug 'https://github.com/preservim/nerdtree'			" Explorador de archivos.
Plug 'https://github.com/tpope/vim-commentary'			" Para comentar código.
Plug 'https://github.com/vim-airline/vim-airline'		" Plugin de barra de estado.
Plug 'https://github.com/ap/vim-css-color'				" Previsualiza colores CSS.
Plug 'https://github.com/rafi/awesome-vim-colorschemes'	" Varios esquemas de color.
Plug 'https://github.com/neoclide/coc.nvim'				" Framework de autocompletado.
Plug 'https://github.com/ryanoasis/vim-devicons'		" Muestra iconos de desarrollador para tipos de archivo.
Plug 'https://github.com/tc50cal/vim-terminal'			" Permite abrir una terminal dentro de Neovim.
Plug 'https://github.com/preservim/tagbar'				" Plugin de navegación de código.
Plug 'https://github.com/terryma/vim-multiple-cursors'	" Permite crear múltiples cursores.
Plug 'windwp/nvim-autopairs'							" Empareja automáticamente paréntesis, comillas, etc.
Plug 'lukas-reineke/indent-blankline.nvim'				" Resalta las líneas en blanco sangradas.

call plug#end()

" NNoreMap, asignaciones de teclas (modo normal):
" Enfoca NerdTree.
nnoremap <C-f> :NERDTreeFocus<CR>
" Abre NerdTree.
nnoremap <C-n> :NERDTree<CR>
" Alterna la visibilidad de NerdTree.
nnoremap <C-t> :NERDTreeToggle<CR>
" Abre el explorador de archivos.
nnoremap <C-e> :Lexplore<CR>
" Deshace los cambios.
nnoremap <C-u> :undo<CR>
" Rehace los cambios.
nnoremap <C-r> :redo<CR>
" Guarda el archivo.
nnoremap <C-s> :w<CR>
" Cierra el archivo.
nnoremap <S-w> :q<CR>
" Cierra el archivo a la fuerza.
nnoremap <S-q> :q!<CR>
" Abre una nueva pestaña.
nnoremap <S-t> :tabnew<CR>
" Buscar
nnoremap <S-f> ?
" Copiar
nnoremap <C-c> yy
" Cortar
nnoremap <C-x> dd
" Pegar
nnoremap <C-v> p
" Añadir ventana horizontal
nnoremap <S-s> :sp<CR>
" Añadir ventana vertical
nnoremap <S-d> :vs<CR>
" Mapeo para borrar una palabra con Ctrl + Backspace
nnoremap <C-h> <C-w>b

" Funciones
" Function Open Split Terminal
function! OpenTerm()
	execute "split"
	:terminal!
endfunction

" NMap, Asignaciones de modo normal.
" Abrir Terminal
nmap <F5> :terminal<CR> i
" Abrir terminal en una ventana vertical.
nmap <S-e> :call OpenTerm()<CR> i

" Kill BS Word
:imap <C-BS> <C-w>

:set completeopt-=preview " Desactiva las vistas previas en las compleciones

" Establece el esquema de color a abstract.
:colorscheme abstract

" Asignar simbolos NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Install Coc Langs
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

" AirLine If Exist
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" INoreMap, Modo visual.
" Autocomplete
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" Elimina la selección visual actual.
inoremap <C-Del> <C-w>
" Elimina con retroceso en modo visual.
inoremap <C-H> <C-w>
" Copiar en modo visual
inoremap <C-c> y
" Cortar en modo visual
inoremap <C-x> d
" Pegar en modo visual
inoremap <C-v> p

lua << EOF
require("nvim-autopairs").setup {}
EOF
