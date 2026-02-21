
" ============================================================================
" .vimrc ¿ VERSION ULTRA-LIGHT, RAPIDE ET ROBUSTE
" ============================================================================
" - Compatible Vim / Neovim
" - Aucun plugin UI (explorateur, statusline, icônes¿)
" - Pensé pour le SSH, les gros fichiers et la longévité
" ============================================================================

" ----------------------------------------------------------------------------
" DÉTECTION ENVIRONNEMENT
" ----------------------------------------------------------------------------
let g:is_nvim = has('nvim')

" ----------------------------------------------------------------------------
" BASE ESSENTIELLE
" ----------------------------------------------------------------------------
set nocompatible                 " Désactive le mode vi ancien
filetype plugin indent on        " Filetypes + plugins + indent
syntax enable                    " Coloration syntaxique

" ----------------------------------------------------------------------------
" ENCODAGE
" ----------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

" ----------------------------------------------------------------------------
" FICHIERS TEMPORAIRES & UNDO
" ----------------------------------------------------------------------------
set nobackup                     " Pas de fichiers ~
set nowritebackup
set noswapfile                   " Pas de .swp
set undofile                     " Undo persistant
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p', 0700)
endif

" ----------------------------------------------------------------------------
" INTERFACE (sobre mais efficace)
" ----------------------------------------------------------------------------
set number                       " Numéros de ligne
set ruler                        " Position du curseur
set showcmd                      " Commandes en cours
set cursorline                   " Ligne courante surlignée
set laststatus=0                " Statusline toujours visible
" highlight StatusLine ctermfg=Grey ctermbg=Black
" highlight StatusLineNC ctermfg=DarkGrey ctermbg=Black

set scrolloff=8
set sidescrolloff=8
set wildmenu                     " Complétion améliorée
set wildmode=longest:full,full
set title                        " Titre du terminal

set novisualbell
set noerrorbells
set mouse=a                      " Souris activée (désactivable si besoin)

set colorcolumn=          " Guides visuels
set cmdheight=2
set updatetime=300
set shortmess+=c
set conceallevel=0

" Affichage des caractères invisibles
set list
set listchars=tab:¿\ ,trail:·,nbsp:¿,extends:¿,precedes:¿

" ----------------------------------------------------------------------------
" RECHERCHE
" ----------------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" ----------------------------------------------------------------------------
" ÉDITION & INDENTATION
" ----------------------------------------------------------------------------
set backspace=indent,eol,start
set autoindent
set smartindent

set expandtab                    " Espaces au lieu de tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround

set wrap
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t
set formatoptions+=j

set showmatch
set matchtime=2
set matchpairs+=<:>

" ----------------------------------------------------------------------------
" PERFORMANCE
" ----------------------------------------------------------------------------
set lazyredraw                   " Accélère macros
set ttyfast
set synmaxcol=500                " Évite les ralentissements sur lignes longues

" ----------------------------------------------------------------------------
" SPLITS
" ----------------------------------------------------------------------------
set splitbelow
set splitright

" ----------------------------------------------------------------------------
" LEADER
" ----------------------------------------------------------------------------
let mapleader = " "
let maplocalleader = "\\"

" ----------------------------------------------------------------------------
" NAVIGATION
" ----------------------------------------------------------------------------
" Navigation dans les splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigation logique dans lignes wrappées
nnoremap j gj
nnoremap k gk

" Début / fin de ligne
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" ----------------------------------------------------------------------------
" COMMANDES RAPIDES
" ----------------------------------------------------------------------------
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>

nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>x :x<CR>

nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap Y y$

" Indentation visuelle persistante
vnoremap < <gv
vnoremap > >gv

" Déplacer des lignes (Alt + fallback leader)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <leader>J :m .+1<CR>==
nnoremap <leader>K :m .-2<CR>==

" Dupliquer
nnoremap <leader>d :t.<CR>
vnoremap <leader>d :t'><CR>gv

" Sélectionner tout
nnoremap <leader>a ggVG

" Coller sans écraser le registre
vnoremap <leader>p "_dP

" ----------------------------------------------------------------------------
" BUFFERS / TABS
" ----------------------------------------------------------------------------
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bl :buffers<CR>

nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

" ----------------------------------------------------------------------------
" DIVERS
" ----------------------------------------------------------------------------
nnoremap <leader>R :source $MYVIMRC<CR>:echo "vimrc rechargé"<CR>
nnoremap <leader>V :edit $MYVIMRC<CR>
nnoremap <leader>n :set relativenumber!<CR>
nnoremap <leader>W :set wrap!<CR>

set pastetoggle=<F2>
nnoremap <F7> :setlocal spell! spelllang=fr,en<CR>

" Presse-papier système (si disponible)
if has('clipboard')
  vnoremap <C-c> "+y
  nnoremap <C-c> "+yy
  nnoremap <C-v> "+p
  inoremap <C-v> <C-r>+
endif

" ----------------------------------------------------------------------------
" COMMANDES PERSONNALISÉES
" ----------------------------------------------------------------------------
command! TrimWhitespace %s/\s\+$//e
command! MakeExecutable !chmod +x %
command! SudoWrite execute 'write !sudo tee ' . shellescape(expand('%')) . ' >/dev/null'

" ----------------------------------------------------------------------------
" AUTOCOMMANDES
" ----------------------------------------------------------------------------
augroup CoreAutoCmds
  autocmd!
  autocmd BufWritePre * silent! %s/\s\+$//e
  autocmd VimResized * wincmd =
augroup END

" Highlight yank (Neovim uniquement)
if g:is_nvim
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 200 }
endif

" Revenir à la dernière position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ execute "normal! g`\"" |
  \ endif

" ----------------------------------------------------------------------------
" FILETYPES
" ----------------------------------------------------------------------------
augroup FileTypeSettings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 colorcolumn=79,120
  autocmd FileType javascript,typescript,json,html,css,scss,yaml setlocal tabstop=2 shiftwidth=2
  autocmd FileType markdown,gitcommit setlocal wrap linebreak spell spelllang=fr,en
  autocmd FileType gitcommit setlocal colorcolumn=72
augroup END




source ~/.vim/k8s.vim