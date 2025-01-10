" =======================================
" Early Exit for 'evim'
" =======================================
if v:progname =~? "evim"
  finish
endif

" =======================================
" Default Settings
" =======================================
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup " Use versions instead of backup files
else
  set backup   " Keep backup files
  if has('persistent_undo')
    set undofile " Enable persistent undo
  endif
endif

if &t_Co > 2 || has("gui_running")
  set hlsearch " Highlight search results
endif

" =======================================
" Autocommands
" =======================================
augroup vimrcEx
  autocmd!
  autocmd FileType text setlocal textwidth=78 " Set 'textwidth' for text files
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" =======================================
" Plugin Management
" =======================================
call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" =======================================
" Key Mappings
" =======================================

" Define leader key as Space
let mapleader = " " 

augroup xsel
  autocmd!
  vnoremap <silent> <leader>c :silent w !xsel -sb >/dev/null 2>&1<CR>
  nnoremap <silent> <leader>v :r !xsel -ob<CR>
augroup END

" Disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

nnoremap <leader>/ :noh<CR>

" FZF mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

inoremap jj <Esc>

" =======================================
" FZF Configuration
" =======================================
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%,border-sharp', 'ctrl-/']
let g:fzf_layout = {
      \ 'window': {
      \   'width': 1,
      \   'height': 0.4,
      \   'yoffset': 1,
      \   'border': 'sharp',
      \   'relative': v:true
      \ }
      \ }

" =======================================
" UI Enhancements
" =======================================
set shortmess+=I      " Disable welcome splash screen
set laststatus=2      " Always show status line
set noshowmode        " Hide mode display (handled by status line)
set termguicolors     " Enable 24-bit colors
colorscheme catppuccin_mocha " Set color scheme
let g:lightline = { 'colorscheme': 'catppuccin_mocha' }

" =======================================
" Miscellaneous
" =======================================
set nu rnu " Enable relative/absolute line numbers based on mode
hi ErrorMsg cterm=bold gui=bold " Customize error message display
