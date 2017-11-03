" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix:     $HOME/.config/nvim/init.vim
"     for Windows:  %LOCALAPPDATA%\nvim\init.vim

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set number
set relativenumber
set backupdir=~/.local/share/nvim/backup "set backup path

" Switch syntax highlighting on
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'wincent/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
 Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Command-line Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"neovim theme inspired by Oceanic Next for Sublime.
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ntpeters/vim-better-whitespace' "highlight whitespaces. Toggle with :ToggleWhitespace, clean with :StripWhitespace
Plug 'altercation/vim-colors-solarized', { 'set': 'all' }
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'robertbasic/vim-hugo-helper'
Plug 'w0rp/ale'
"Plug 'dylanaraps/wal.vim' "wal colorscheme


" All of your Plugins must be added before the following line
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"set encoding=utf8
"set guifont=FuraMono\ Nerd\ Font\ Mono:h11
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1
syntax enable
colorscheme apprentice "wal "solarized "OceanicNext
" set background=light
let g:airline_theme='apprentice' "'solarized' "'oceanicnext'
let g:airline#extensions#ale#enabled=1

let g:pandoc#spell#default_langs=["pt_pt"]

"""BASIC TOOLS
"Navigating with guides
inoremap <Space><Space> <Esc>/(<>)<Enter>"_c4l
imap <M-BS> <C-W>

"pandoc
autocmd Filetype pandoc inoremap ;tit \begin{tabu}{@{}X@{}}\end{tabu}(<>)<Esc>3b4hi
autocmd Filetype pandoc map <F5> :!make pdf<Enter>

"tex
autocmd Filetype tex inoremap ;tit \begin{tabu}{@{}X@{}}\end{tabu}(<>)<Esc>3b4hi
autocmd Filetype tex setlocal spell spelllang=pt

let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'xelatex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'skim'
let g:formatdef_latexindent = '"latexindentwrapper"'
let g:formatters_tex = ['latexindent']

"fzf config
" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"use pandoc with markdown linter
let g:ale_linter_aliases = {'pandoc': ['markdown']}

" ========
" Key maps
" ========

" Open ~/.config/nvim/init.vim
nnoremap <leader>r :e ~/.config/nvim/init.vim<CR>
noremap <Leader>w :w<CR>
" Select another file from the directory of the current one
nnoremap <leader>F :execute 'edit' expand("%:p:h")<cr>

" ===============
" Plugin Key Maps
" ===============

" fzf
nnoremap <leader>f :Files<CR>
