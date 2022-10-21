let mapleader=";"
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
" seting the cursor in the mid of the screen
:set scrolloff=999
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
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'jiangmiao/auto-pairs' " for automatically clses paraenthieses,square
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
"Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto completion
"Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
"Plug nvim-telescope/telescope.nvim' " telecope like fuzzy file finder
Plug 'nvim-telescope/telescope-fzf-native.nvim',{ 'do': 'make' } " telecope like fuzzy file finder
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
" for markdown editor
Plug 'davidgranstrom/nvim-markdown-preview' " review in the broswer in real time
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " same as above with more glyphs features
" Plugins for bash script
Plug 'vim-scripts/bats.vim'
Plug 'vim-scripts/bash-support.vim'
" fuzzy finder for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder for files
Plug 'junegunn/fzf.vim'
" Plug for html
Plug 'othree/html5-syntax.vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'valloric/matchtagalways'
Plug 'alvan/vim-closetag'
"   Latex 
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview',{'for': 'tex'}

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'


" java 
"Plug 'SirVer/ultisnips'
"Plug 'ncm2/ncm2-ultisnips'
""Plug 'artur-shaik/vim-javacomplete2'
"Plug 'neoclide/coc-java'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'



call plug#end()

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
"inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"inoremap <c-y> <ESC>
"
"" Required for operations modifying multiple buffers like rename.
"set hidden
"
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
"
"" note that if you are using Plug mapping you should not use `noremap` mappings.
"nmap <F5> <Plug>(lcn-menu)
"" Or map each action separately
"nmap <silent>K <Plug>(lcn-hover)
"nmap <silent> gd <Plug>(lcn-definition)
"nmap <silent> <F2> <Plug>(lcn-rename)
"set runtimepath^=~/.local/share/nvim/vim-javacomplete2/
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"let g:JavaComplete_EnableDefaultMappings = 0
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
"



"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"let g:tmuxline_preset = {
"      \'a'    : '#S',
"      \'c'    : ['#(current_pane_path)'],
"      \'win'  : ['#I', '#W'],
"      \'cwin' : ['#I', '#W', '#F'],
"      \'y'    : ['%R', '%a', '%Y'],
"      \'z'    : '#H'}
"
let g:tmuxline_preset = 'tmux' 
let g:tmuxline_powerline_separators = 0

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


" key maps edits
map <F6> :setlocal spell spelllang=eg_us<CR>

" java snippest
autocmd FileType java inoremap ;cls class<Space>(<>)<Enter>{<Space><Enter>public static void main(String args[])<Enter>{<Space><Enter>(<>)<Enter>}<Enter>}<Esc>6kf(c4l
autocmd FileType java inoremap ;pr System.out.println("(<>)"(<>));<Esc>F"c4h
map <F4> :!java % <CR>





"""latex start 
autocmd FileType tex setl updatetime=3000
let g:livepreview_previewer = 'zathura'
autocmd FileType tex nnoremap <C-t> :w<Enter>:!bibtex<Space><C-R>%<Backspace><Backspace><Backspace><Enter>

inoremap <leader><leader> <Esc>/(<>)<Enter>"_c4l
vnoremap <leader><leader> <Esc>/(<>)<Enter>"_c4l
map <leader><leader> <Esc>/(<>)<Enter>"_c4l

autocmd FileType tex inoremap ;th \thanks{}<Space><Enter>(<>)<Esc>1kf}i 
autocmd FileType tex inoremap ;ma \maketitle<Space><Enter>(<>)<Esc>I
autocmd FileType tex inoremap ;fr \frac{}{(<>)}<Space>(<>)<Esc>I<Esc>f}i
autocmd FileType tex inoremap ;da \date{}<Space><Enter>(<>)<Esc>1kf}i 
autocmd FileType tex inoremap ;ti \title{}<Space><Enter>(<>)<Esc>1kf}i
autocmd FileType tex inoremap ;au \author{}<Space><Enter>(<>)<Esc>1kf}i
autocmd FileType tex inoremap ;doc \documentclass{}<Space><Enter>(<>)<Esc>1kf}i
autocmd FileType tex inoremap ;ne \newline<Space><Enter>(<>)<Esc>T{i
autocmd FileType tex inoremap ;em \emph{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;c \cite{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;p \citep{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter>(<>)<Esc>3kA\item<Space>(<>)<Enter>\item (<>)<Enter>\item (<>)<Esc>2kF\  
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter>(<>)<Esc>3kA\item<Space>(<>)<Enter>\item (<>)<Enter>\item (<>)<Esc>2kF\  
autocmd FileType tex inoremap ;r \ref{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;be \begin{%DELRN%}<Enter>(<>)<Enter>\end{%DELRN%}<Enter>(<>)<Esc>F(8X<Space><Esc>1kf\4X<Esc>2kf{:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex inoremap ;a \href{}<Space>(<>)<Esc>T{i
autocmd FileType tex inoremap ;sec \section{}<Enter>(<>)<Esc>1kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter>(<>)<Esc>1kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter>(<>)<Esc>2kf}i
autocmd FileType tex inoremap ;up \usepackage{}<Space><Enter>(<>)<Esc>1kf}i
 


""" latex end 












" split navigation
nnoremap <C-J> <C-J>
nnoremap <C-K> <C-K>
nnoremap <C-L> <C-L>
nnoremap <C-H> <C-H>
" Fzf keymaps
    nnoremap <C-o> :Color<CR>
    nnoremap <C-f> :Files<CR>
" CTRL-/ will t-popes commentary for commenting out code
   map <leader>q !: pdflatex % <CR><CR>
   map <leader>x !: mupdf-x11 $(echo% \| sed 's/tex$/pdf/' ) & disown <CR>
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


" To add ymal to md files
    map <leader>y :!add_1_line % <CR><CR>
"" To go in navigation mode
    map <leader>q :e . <CR>
""Compile document, be it groff/latex/markdown/etc. 
"    map <leader>c :w! \| !compiler <c-r>%<CR>
"" Turn on Autocompiler mode 
"    map <leader>a :!setsid autocomp % &<CR>
""Open corresponding .pdf/.html or preview 
"    map <leader>p :!opout <c-r>%<CR><CR>    
" To conver md files to html
    map <leader>o :!md-to-html % <CR>    
" Trying to render only name of file % it is giving whole real path of file
    "map <leader>s :w <CR>:w! $HOME/.local/home/diary/diary-md/('<c-r>%').md<CR>
  "  map <leader>s :w <CR>:w! $HOME/.local/new-site/ukant/content/daily//%:t.md<CR>
     map <leader>s :w <CR>:w! $HOME/.local/test/content/Ukant//%:t.md<CR>
" When shortcut files are updated, renew bash and ranger configs with new material:
    "autocmd BufWritePost bm-files,bm-dirs !shortcuts
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

" Source vim configuration file whenever it is saved
if has ('autocmd')          " Remain compatible with earlier versions
 augroup Reload_Vimrc       " Group name.  Always use a unique name!
"    autocmd!                " Clear any preexisting autocommands from this group
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" kemaps for compiling and running the code
" for CPP
"nnoremap cpp :!c++ % -o %:r && %:r:<CR>
"" ----
""for C 
"nnoremap c :!gcc % -o %:r && %:r:<CR>
"" ----
""for Python
"nnoremap py :python %<CR>
"" ----
"" for jaca
"nnoremap ,j :!javac % && java %:r<CR>

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
nnoremap <leader>q :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>


:colorscheme dracula 
":colorscheme sonokai 
":colorscheme gotham  
":colorscheme onedark 
":colorscheme dogrun 
":colorscheme purify

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
