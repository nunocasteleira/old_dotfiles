"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/nunocasteleira/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/nunocasteleira/.local/share/dein')
	call dein#begin('/Users/nunocasteleira/.local/share/dein')

	" Let dein manage dein
	" Required:
	call dein#add('/Users/nunocasteleira/.local/share/dein/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here:
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('tpope/vim-fugitive')
"	" ./install --all so the interactive script doesn't block
"	" you can check the other command line options  in the install file
	call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
	call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('lervag/vimtex')
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	call dein#add('robertbasic/vim-hugo-helper')
"	"	call dein#add('w0rp/ale')
""	call dein#add('dylanaraps/wal.vim') "wal colorscheme
	call dein#add('tpope/vim-surround')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('mileszs/ack.vim')
"	call dein#add('neomake/neomake')
	call dein#add('junegunn/goyo.vim')
	call dein#add('tibabit/vim-templates')
	call dein#add('ledger/vim-ledger')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------


set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set number
set relativenumber
set backupdir=~/.local/share/nvim/backup "set backup path

" Also switch on highlighting the last used search pattern.
set hlsearch

set wrap	  " Sets soft wrap
set linebreak	  " breaks at selected symbols SpaceTab!@*-+;:,./?
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

set encoding=utf8
set guifont=FuraMono\ Nerd\ Font\ Mono:h11
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1
colorscheme apprentice "wal "solarized "OceanicNext
" set background=light
let g:airline_theme='apprentice' "'solarized' "'oceanicnext'
let g:airline#extensions#ale#enabled=1

"""BASIC TOOLS
"Navigating with guides
" inoremap <Space><Space> <Esc>/(<>)<Enter>"_c4l

"pandoc
autocmd Filetype pandoc inoremap ;tit \begin{tabu}{@{}X@{}}\end{tabu}(<>)<Esc>3b4hi
autocmd Filetype pandoc map <F5> :!make pdf<Enter>

"tex
autocmd Filetype tex inoremap ;tit \begin{tabu}{@{}X@{}}\end{tabu}(<>)<Esc>3b4hi
autocmd Filetype tex inoremap ;p: \piece{}: (<>)<Esc>2ba
autocmd Filetype tex inoremap ;pp \piece{} (<>)<Esc>2ba
autocmd Filetype tex inoremap ;t \technique{} (<>)<Esc>2ba
autocmd Filetype tex setlocal spell spelllang=pt

let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'xelatex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'skim'
let g:formatdef_latexindent = '"latexindentwrapper"'
let g:formatters_tex = ['latexindent']

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" Using neosnippet#anonymous
inoremap <silent><expr> __ neosnippet#anonymous('_${1}${0}')
inoremap <silent><expr> ^^ neosnippet#anonymous('^${1}${0}')

" I want to use my tab more smarter. If we are inside a completion menu jump
" to the next item. Otherwise check if there is any snippet to expand, if yes
" expand it. Also if inside a snippet and we need to jump tab jumps. If none
" of the above matches we just call our usual 'tab'.

" deoplete + neosnippet + autopairs changes
let g:deoplete#enable_at_startup = 1
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

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

" ALE
"use pandoc with markdown linter
let g:ale_linter_aliases = {'pandoc': ['markdown']}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'


" NERDTree
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

" ========
" Key maps
" ========

" Open ~/.config/nvim/init.vim
nnoremap <leader>r :e ~/.dotfiles/nvim/init.vim<CR>
noremap <Leader>w :w<CR>
" Select another file from the directory of the current one
nnoremap <leader>F :execute 'edit' expand("%:p:h")<cr>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>b :Buffers<CR>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk
nmap \g :Gstatus<CR>
nmap \q :nohlsearch<CR>

" Use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

" ===============
" Plugin Key Maps
" ===============

" fzf
nnoremap <leader>f :Files<CR>
