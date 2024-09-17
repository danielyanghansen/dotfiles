" Keep in mind: This is only for Neovim, just because I didn't figure out vim-plug in native vim
:set number                     " Line number
:set relativenumber             " Line relative numbers
:set autoindent                 " Autoindent
:set tabstop=4                  " No Columns in a tab
:set shiftwidth=4               " Width for autoindents
:set smarttab                   " Smart Tabbing 
:set softtabstop=4              " See multiple spaces as tabstops
:set mouse=a                    " Enable mouse
:set hlsearch                   " Highlight search
:set ttyfast					" Speed up scrolling


" Plugins, using vim-plug. Install with :PlugInstall and update with :PlugUpdate
" All plugins should be in $HOME/.local/share/nvim/plugged
call plug#begin()

Plug 'http://github.com/tpope/vim-surround'				" Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree'			" NerdTree
Plug 'https://github.com/tpope/vim-commentary'			" For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'		" Status bar
Plug 'https://github.com/lifepillar/pgsql.vim'			" PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color'				" CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " A bunch of cool color schemes
Plug 'https://github.com/neoclide/coc.nvim'				" Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons'		" Developer Icons NB! Might require a nerdfont installed
Plug 'https://github.com/tc50cal/vim-terminal'			" Vim Terminal
Plug 'https://github.com/preservim/tagbar'				" Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors'	" CTRL + N for multiple cursors
Plug 'https://github.com/lambdalisue/suda.vim/'			" Sudo
set encoding=UTF-8

call plug#end()

 colorscheme space-vim-dark
" colorscheme iceberg 
" colorscheme gotham
" colorscheme onedark

" KEYBINDINGS
	" Nerdtree 
	nnoremap <C-f> :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>

	" CoC jump to definition 
	nnoremap <C-l> :call CoCActionAsync('jumpDefinition')<CR>

	" CoC defaults, see https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
	inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
	inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
	" Familiar keybinds
	nnoremap <C-s> :w<CR>
	nnoremap <C-d> :q<CR>

" NERDTree Icons
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"



" ========================== NOTES ==========================
" vim-plug:
"	:PlugClean :PlugInstall :PlugUpdate
"
" Conquerors of Completion (CoC):
"	:CocInstall coc-python
"	:CocInstall coc-clangd
"	:CocInstall coc-snippets
"	:CocCommand snippets.edit... FOR EACH FILE TYPE
