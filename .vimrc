" TODO: break up this vimrc into multiple rc files?
" if filereadable(expand("~/.gvimrc.after"))
"   source ~/.gvimrc.after
" endif

" turn off compatibility with the old vi
set nocompatible


"""""""""""""""""""""VUNDLE/"""""""""""""""""""""""""
" will turn this back on later, need to turn it off for vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  " call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  " GIT integration
  Plugin 'tpope/vim-fugitive'

  " syntax highlighting
  Plugin 'slim-template/vim-slim'
  Plugin 'kchmck/vim-coffee-script'

  Plugin 'wincent/command-t'
  Plugin 'kana/vim-textobj-user' " required for vim-textobj-rubyblock
  Plugin 'nelstrom/vim-textobj-rubyblock'
  "
  " The following are examples of different formats supported.
  " plugin on GitHub repo:
  " Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Avoid a name conflict with L9
  " Plugin 'user/L9', {'name': 'newL9'}

  " All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required for vundle
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""/VUNDLE"""""""""""""""""""""""""


""""""""""""""""" ADVANCED SETUP """"""""""""""""""""""""""
" set compiler support for ruby
compiler ruby
""""""""""""""""" /ADVANCED SETUP """"""""""""""""""""""""""


""""""""""""""""" CODE """"""""""""""""""""""""""
" abbreviations (also insensitive)
iab spl System.out.println("
iab sep System.err.println("
iab jtry try {<CR><CR>}<CR>catch (Exception ex) {<CR><CR>}
iab ppd System.err.println("MELCH_DEBUG:
iab itt I18n.t("")<Esc>hi
iab cclog console.log();<Esc>hi
iab dsf (Date.today +).strftime<Esc>hhhhhhhhhi
ab bgc background-color:
ab bcb border: 1px solid black;
ab bgu background: url(
ab hhd <div id="" class=""><CR></div><Esc>Oi
ab rrs <%%><Esc>hi
ab rrp <%=%><Esc>hi
ab rtt <%= I18n.t("") %><Esc>hhhhi
ab mbtr -moz-border-radius-topright:<CR>-webkit-border-top-right-radius:<CR>border-top-right-radius:<Esc>kkA
ab mbbr -moz-border-radius-bottomright:<CR>-webkit-border-bottom-right-radius:<CR>border-bottom-right-radius:<Esc>kkA
ab mbbl -moz-border-radius-bottomleft:<CR>-webkit-border-bottom-left-radius:<CR>border-bottom-left-radius:<Esc>kkA
ab mbtl -moz-border-radius-topleft:<CR>-webkit-border-top-left-radius:<CR>border-top-left-radius:<Esc>kkA
ab mbr -moz-border-radius:<CR>-webkit-border-radius:<CR>border-radius:<Esc>kkA
iab hh1 <h1></h1><Esc>hhhhi
iab hh2 <h2></h2><Esc>hhhhi
iab hh3 <h3></h3><Esc>hhhhi
iab hh4 <h4></h4><Esc>hhhhi
iab hh5 <h5></h5><Esc>hhhhi
iab hh6 <h6></h6><Esc>hhhhi
iab hhh <html></html><Esc>hhhhhhi
iab hhb <body></body><Esc>hhhhhhi
iab hhead <head></head><Esc>hhhhhhi
iab hhj <script></script><Esc>hhhhhhhhi
iab hhs <style></style><Esc>hhhhhhhi
iab hhtable <table></table><Esc>hhhhhhhi
iab hhthead <thead></thead><Esc>hhhhhhhi
iab hhtr <tr></tr><Esc>hhhhi
iab hhtd <td></td><Esc>hhhhi
iab hhth <th></th><Esc>hhhhi
iab hhbut <button></button><Esc>hhhhhhhhi
iab hhbutton <button></button><Esc>hhhhhhhhi
iab hhbr <br/>
iab jf function someFunc() {}<Esc>ha
iab rdb puts "\n" + "*" * 35 + "melch debug" + "*" * 35 <CR>puts "*" * 81<Esc>Oputs
iab tdr # TODOmelch
iab tdj // TODOmelch
iab tdm TODOmelch
iab bbp binding.pry
""""""""""""""""" /CODE """"""""""""""""""""""""""


""""""""""""""""" TAB NAVIGATION """"""""""""""""""""""""""
map R gT
map T gt
map <leader>0 :tabr<CR>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
""""""""""""""""" /TAB NAVIGATION """"""""""""""""""""""""""


""""""""""""""""" EDITING """"""""""""""""""""""""""
" yank to end of line (like C and D go to end of line)
map Y y$

" inserts single character than returns to normal mode
map K i_<esc>r

" link control-cvx to system copy paste buffer
" must have a vim version that's been compiled with clipboard support
" command-c and some other commands have been hijacked by iTerm2
" vmap <D-c> "+y
" vmap <D-v> "+p
" vmap <D-x> "+d

" cut and paste to/from system buffer
vmap <leader>c "+y
vmap <leader>v "+p
vmap <leader>x "+d
vmap <leader>b :!pbcopy<CR>u

" Set p to use indentation
map p ]p
map P [p
""""""""""""""""" /EDITING """"""""""""""""""""""""""


""""""""""""""""" MISC """"""""""""""""""""""""""
" Stop accidental F1 hits
map <F1> <esc>
imap <F1> <esc>
nmap <F1> <esc>
vmap <F1> <esc>

" Show registers
map <leader>r :reg<CR>
""""""""""""""""" /MISC """"""""""""""""""""""""""


""""""""""""""""" PLUGIN SPECIFIC """"""""""""""""""""""""""
" for align
vmap <leader>a :Align =><CR>
" AlignCtrl W
" map <leader>s :s/:/@@@/g<CR>gv:Align => @@@<CR>gv:s/\(^ *\)\@<= @@@ /:/g<CR>gv:s/@@@ /:/g<CR>gv:s/>  :/> :/g<CR>
" map <leader>s :s/:/@@@/g<CR>gv:Align => @@@<CR>gv:s/\(^ *\)\@<= @@@ /:/g<CR>gv:s/@@@ /:/g<CR>gv:s/>  :/> :/g<CR>gv:s/{  /{ /g<CR>

" Because slim-template/vim-slim was not recognizing .html.slim as slim files
autocmd BufNewFile,BufRead *.slim set ft=slim

" Configure matchit so that it goes from opening tag to closing tag
filetype plugin on " required for matchit
au FileType html,eruby,rb,css,js,xml runtime! macros/matchit.vim

"Command-T
" I have other things I use command-t for in muscle memory, so map to command-p
noremap <c-p> :CommandT<CR>
" switch default 'enter' to open in new tab
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTMatchWindowReverse = 1
" esc and arrow keys exit and move file selection when cmd t is open
if &term =~ "xterm" || &term =~ "screen"
	let g:CommandTCancelMap=['<ESC>','<C-c>']
	let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
	let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']
endif
""""""""""""""""" /PLUGIN SPECIFIC """"""""""""""""""""""""""


""""""""""""""""" HIGHLIGHTING AND DISPLAY """"""""""""""""""""""""""
" syntax highlighting should be readable...
color molokai
let g:molokai_original=1

"font and size
set guifont=Menlo:h14

"Highlight colors
highlight PmenuSel ctermbg=Blue ctermfg=Grey
highlight Pmenu ctermbg=Grey ctermfg=Black
highlight MatchParen ctermbg=Grey ctermfg=Black
highlight TabLineSel ctermbg=Blue ctermfg=Grey
highlight TabLineFill ctermbg=Black ctermfg=Black
highlight FoldColumn ctermbg=Blue ctermfg=Grey
highlight Folded ctermbg=Black ctermfg=Cyan
highlight ExtraWhitespace ctermbg=Red ctermfg=Black
highlight Tab ctermbg=DarkRed ctermfg=Black
match ExtraWhitespace /\s\+$/

"for SASS
au BufRead,BufNewFile *.scss set filetype=scss

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

" example to set YAML higlighting for todo files
" au BufRead,BufNewFile *_to_do.txt set filetype=yaml
""""""""""""""""" /HIGHLIGHTING AND DISPLAY """"""""""""""""""""""""""


""""""""""""""""" BASIC VIM OPTIONS SETUP """"""""""""""""""""""""""
" treats one_word and one-word as one word when browsing
" set iskeyword=_,-

" set our tabs to two spaces
set shiftwidth=2
set tabstop=2
set expandtab

" turn syntax highlighting on by default
syntax on
syntax enable

" set auto-indenting on for programming
set ai

" turn on filetype detection
filetype on

" no visual bell or error bell
set noerrorbells novisualbell

" highlight words when searching for them.
set hlsearch

" automatically show matching brackets. works like it does in bbedit.
set showmatch

" do not put a carriage return at the end of the last line
set binary noeol

" make that backspace key work the way I think it should
set backspace=indent,eol,start

" case-insensitive matching
set ic

"line numbering
se nu

set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0