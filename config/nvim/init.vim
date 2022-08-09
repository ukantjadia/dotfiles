let mapleader=","
:set relativenumber
:set autoindent
:set tabstop=8
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse-=a
:set nowrap
:set number
:set incsearch
:set autoread
":set noswapfile " Dont use swap files and clog up with work
:set t_Co=256
" setting split veiw
:set formatoptions-=cro
:set splitbelow
:set splitright
:set expandtab " Expand TABs to spaces
:set clipboard=unnamed,unnamedplus " Allow copied vim text to also added to clipboard
:set ignorecase " search ignoreing case 
:set nocompatible "Dont worry about VI compatability
:set nohlsearch " Disable search highlighting 
" Enabling the auto commenting on new line 
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" goyo plugin edit
    map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" This makes vim transparent in terminal by default
hi Normal ctermbg=NONE

let t:is_transparent = 0
function! Toggle_transparent()
   if t:is_transparent == 0
       if has ('gui_running')
           " Sets gVim to transparent
           :silent !transset -a --dec 0.15 
       else
           " Sets vim to opaque
           set background=dark
       endif
       let t:is_transparent = 1
   else
       if has ('gui_running')
           " Sets gVim to opaque
           :silent !transset -a --max 1 
       else
           " Sets vim to transparent
           hi Normal ctermbg=NONE
       endif
       let t:is_transparent = 0
   endif
endfunction
nnoremap <F1> : call Toggle_transparent()<CR>

call plug#begin()

Plug 'vim-pandoc/vim-rmarkdown' " Plug in for RMarkdown 
Plug 'junegunn/goyo.vim' " it makes text more readable when writting prose
Plug 'vim-pandoc/vim-pandoc' " The pandoc vim plug for markdown 
Plug 'mrjones2014/smart-splits.nvim'
Plug 'vim-pandoc/vim-pandoc-syntax' " The pandoc plug require the systax plug in also
Plug 'dracula/vim',{'as':'dracula'} " Dracula theme for nivm 
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'jiangmiao/auto-pairs' " for automatically clses paraenthieses,square
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
"Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
"Plug 'nvim-telescope/telescope.nvim' " telecope like fuzzy file finder
Plug 'nvim-telescope/telescope-fzf-native.nvim',{ 'do': 'make' } " telecope like fuzzy file finder
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
" for markdown editor
Plug 'davidgranstrom/nvim-markdown-preview' " review in the broswer in real time
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " same as above with more glyphs features
" Plugins for bash script
Plug 'vim-scripts/bats.vim'
Plug 'vim-scripts/bash-support.vim'
Plug 'auxiliary/vim-layout'
" fuzzy finder for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder for files
Plug 'junegunn/fzf.vim'

call plug#end()

" key maps edits
" split navigation
nnoremap <C-J> <C-J>
nnoremap <C-K> <C-K>
nnoremap <C-L> <C-L>
nnoremap <C-H> <C-H>
" Fzf keymaps
    nnoremap <C-c> :Color<CR>
    nnoremap <C-f> :Files<CR>
" CTRL-/ will t-popes commentary for commenting out code
    map <C-/> gcc
"

" fzf setting layout 
" Popup window -- anchored to the bottom  of the current window
    let g:fzf_layout = { 'window': {'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0} }

" Replace ex mode with jj 
imap jj <esc>

" keymaps for resize or spliting the pans
nnoremap <silent> <C-S-Up> :resize +3<CR>
nnoremap <silent> <C-S-Down> :resize -3<CR>
nnoremap <silent> <C-S-Left> :vertical resize +3<CR>
nnoremap <silent> <C-S-Right> :vertical resize -3<CR>



"Compile document, be it groff/latex/markdown/etc. 
    map <leader>c :w! \| !compiler <c-r>%<CR>
" Turn on Autocompiler mode 
    map <leader>a :!setsid autocomp % &<CR>
"Open corresponding .pdf/.html or preview 
    map <leader>p :!opout <c-r>%<CR><CR>    
    

" When shortcut files are updated, renew bash and ranger configs with new material:
    autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
    autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
    autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
    autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
" Compiling rmd document 
"    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<CR>
    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.html<Enter><Enter>
   " autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>--vanilla<CR>
    "autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>
    "autocmd Filetype rmd innoremap ;r ```{r,<space>echo=TRUE}<CR>```<CR><CR><esc>2k0
" Own commadn 
"    autocmd Filetype rmd map <F5> :RMarkdown html - quiet=FALSE - toc=FALSE<CR>
    autocmd Filetype rmd map <F5> :RMarkdown html <CR>
    "autocmd Filetype rmd map <F5> :RMarkdown html - quite=FALSE <CR>
    " Save file as sudo on files that require root permission
   cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!



" kemaps for compiling and running the code
" for CPP
nnoremap cpp :!c++ % -o %:r && %:r:<CR>
" ----
"for C 
nnoremap c :!gcc % -o %:r && %:r:<CR>
" ----
"for Python
nnoremap py :python %<CR>
" ----
" for jaca
nnoremap ,j :!javac % && java %:r<CR>

" for markdownpreview example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

"""" Filetype-Specific Configuration 
" Markdown and Journal 
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2



" Telescope mappings
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
"nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>

" keymaps for the nerdTree
"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>


":colorscheme dracula 
":colorscheme sonokai 
":colorscheme gotham  
":colorscheme onedark 
":colorscheme dogrun 
:colorscheme purify

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" air-line
let g:airline_powerline_fonts = 1

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

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
