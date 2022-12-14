set nocompatible
set number
set mouse=a
" gitgutter 更新時間縮短
set updatetime=200
set backspace=2
set expandtab
set tabstop=4
set shiftwidth=4
set nu
set ma
" highlight search
set hlsearch
" buffer用新的tab開啟
set switchbuf=newtab
set autoindent
" ~ acting like operator
set tildeop

set t_Co=256
" Vim True Color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" color scheme
if !exists("g:syntax_on")
    syntax on
endif
set background=dark
let g:quantum_black=1
let g:quantum_italics=1

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'

" open detection, plugin and indention for filetype
filetype plugin indent  on

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" run diffs synchronously
" let g:gitgutter_async = 0
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size=2

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" NerdTree
" turn on Nerdtree may cause painfully slow scrolling
" let g:nerdtree_tabs_open_on_console_startup=0
" let NERDTreeShowHidden=1

" Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 1
let g:netrw_winsize = 25
let g:netrw_browse_split = 3

" vim airlines
" let g:airline_theme = 'quantum'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['autoignore']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" statuSline
set statusline+=%F


" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
"  functions

func! PrintPath()
  echo "filetype: " . &filetype
  echo "abs path: " . expand('%:p')
  echo "rel path: " . expand('%:.')
  echo "home path: " . expand('%:~')
endfunc

func! CopyPath()
  let @+ = expand('%:p')
  echo 'path copied!'
endfunc


" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" autogroup & atocmd

augroup file_format
  autocmd!
  " au FileType php setlocal commentstring={{--\ %s\ --}}
  " JSON Beautify
  au FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
  au FileType javascript setlocal ts=2 sw=2 expandtab
  au Filetype typescript setlocal ts=2 sw=2 expandtab
  au Filetype html setlocal ts=2 sw=2
  au BufNewFile,BufRead *.ejs set filetype=html

  au Filetype vim   setlocal tabstop=2 shiftwidth=2 expandtab
  au Filetype c     setlocal tabstop=4 shiftwidth=4 expandtab
  au Filetype cpp   setlocal tabstop=4 shiftwidth=4 expandtab
  au Filetype cmake setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END


" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" key mapping

" tab快捷鍵
nnoremap <f2> :tabnew<CR>
nnoremap <C-e><up> :tabr<CR>
nnoremap <C-e><down> :tabl<CR>
nnoremap <C-e><left> :tabp<CR>
nnoremap <C-e><right> :tabn<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader><left>  gT
nnoremap <leader><right> gt

" toggle netrw
nnoremap <tab> :Lexplore<CR>

" custom func mapping
nnoremap f     :call PrintPath()<CR>
nnoremap <C-c> :call CopyPath()<CR>

" window size
if bufwinnr(1)
  map ≥ <C-W>>
  map ≤ <C-W><
  map ≠ <C-W>+
  map – <C-W>-
  map « <C-W>|
endif

" increase / decrease number
nnoremap å <C-a>
nnoremap ≈ <C-x>

" nnoremap <C-c> :!g++ -o  %:r.out % -std=c++14<Enter>

" Open URI under cursor.
nmap <C-o> <Plug>(openbrowser-open)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" NerdTree Keys
"noremap <tab> :NERDTreeToggle<CR>
"nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" FZF

nmap fb :Buffers<CR>

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" CSCOPE

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
    " show msg when any other cscope db added
set cscopeverbose

    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
nmap zs :tab cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :tab cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :tab cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :tab cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :tab cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :tab cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :tab cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :tab cs find d <C-R>=expand("<cword>")<CR><CR>

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" Vundle

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L10'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin).
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Nerdtree-related
" Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'Xuyuanp/nerdtree-git-plugin'

" Code Linting
" Plugin 'vim-syntastic/syntastic'

Plugin 'junegunn/vim-easy-align' 

" Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'Yggdroot/indentLine'

" 用 gc/gcc 快速下comment
Plugin 'tpope/vim-commentary'
" git status
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

Plugin 'editorconfig/editorconfig-vim'


" Plugin 'wakatime/vim-wakatime'

" 搜尋關鍵字
Plugin 'rking/ag.vim'

" 模糊搜尋檔案
Plugin 'ctrlpvim/ctrlp.vim'

" 自動產生pattern
Plugin 'honza/vim-snippets'
" Plugin 'SirVer/ultisnips'

" vim status bar
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" js syntax
" Plugin 'pangloss/vim-javascript'

" Typescript syntax files for Vim
" Plugin 'leafgarland/typescript-vim'

" 文件上顯示git狀態
Plugin 'airblade/vim-gitgutter'

" 文件小圖案
Plugin 'ryanoasis/vim-devicons'

Plugin 'terryma/vim-multiple-cursors'

" 主題顏色
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'sainnhe/gruvbox-material'

Plugin 'tyru/open-browser.vim'

" Plugin 'eslint/eslint'

" fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" place colorscheme after Plugin	
colorscheme gruvbox-material	
" colorscheme quantum
