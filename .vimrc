" An example for a vimrc file.
"
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" toggle relative/absulote line numbers based on normal/insert
" mode respectivly
set nu rnu

" Define leader
" map leader to space
let mapleader = " " 

" Manage buffers
nnoremap <leader>b :ls<CR>:b<Space> 
nnoremap <leader>/ :noh<CR>

" map 
inoremap jj <Esc>

augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
 autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set term=xterm-256color

call plug#begin()

" List your plugins here
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'

call plug#end()

" Modify status line
set laststatus=2
set noshowmode
set termguicolors

" Enable catppuccin theme
colorscheme catppuccin_mocha 
let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" Theme modifications
" Enable transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Remove italics from the ErrorMsg display
hi ErrorMsg cterm=bold gui=bold
