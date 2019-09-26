if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
nnoremap ZQ :qa<cr>
inoremap jk <esc>
cnoremap jk <esc>
nnoremap <space>feR :source /home/vincent/.vimrc <bar> PlugInstall<cr>
nnoremap <space>fer :source /home/vincent/.vimrc<cr>
nnoremap <leader>ss :%s//g<left><left>
vnoremap <leader>ss :s//g<left><left>
nnoremap <leader>rr :%s/<C-r>0//g<left><left>
vnoremap <leader>rr :s/<C-r>0//g<left><left>
nnoremap <leader>co :g//z#.5 <bar> echo "=========="<home><right><right>
vnoremap <leader>dl :g/^$/d<cr>
noremap <leader>y "ry
noremap ' "
noremap <cr> :
noremap <C-j> <cr>
nnoremap gm m
noremap m "_d
nnoremap mm "_dd
nnoremap M "_d$
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
nnoremap <silent> [ :<c-u>WhichKey  '['<CR>
nnoremap <silent> ] :<c-u>WhichKey  ']'<CR>
nnoremap <silent>zz :MaximizerToggle<CR>
vnoremap <silent>zz :MaximizerToggle<CR>gv
map <C-l> :NERDTreeToggle<CR>
nnoremap <localleader><localleader> :Make<CR>
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)
nnoremap -- :bprev<cr>
nnoremap == :bnext<cr>
nnoremap `` :bdelete<cr>
nnoremap <silent><esc> :nohl<cr>
nmap <leader>pi :call pry#insert()<cr>
nnoremap <leader>wo :ToggleWorkspace<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader><Leader> :Buffers<CR>
nmap <Leader>h :History<CR><Paste>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Ag<Space>'
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>ft :Filetypes<CR>
nmap <leader>aa :A<CR>
nmap <leader>as :AS<CR>
nmap <leader>av :AV<CR>
nnoremap <leader><cr> :<C-p><cr>
nnoremap <localleader>c :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <localleader>c :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <localleader>c :call LanguageClient#textDocument_rename()<CR>
inorema  <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nnoremap gp `[v`]
:vnoremap <silent> al :<c-u>norm!0v$h<cr>
:vnoremap <silent> il :<c-u>norm!^vg_<cr>
:onoremap <silent> al :norm val<cr>
:onoremap <silent> il :norm vil<cr>

let @p="orequire 'pry'; binding.pryjk"
let @j="A;jkJ"

let g:wordmotion_prefix = '-'
let g:wordmotion_spaces = '_-'

set noswapfile
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

set cursorline
set scrolloff=10
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 12.0
set nowrap
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=4
set shiftwidth=4
set expandtab

runtime macros/matchit.vim

call plug#begin()
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-rake'
Plug 'thaerkh/vim-workspace'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'vim-ruby/vim-ruby'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dominikduda/vim_current_word'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'markonm/traces.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'raimondi/delimitmate'
Plug 'andrewradev/splitjoin.vim'
Plug 'justinmk/vim-sneak'
Plug 'flazz/vim-colorschemes'
Plug 'liuchengxu/vim-which-key'
Plug 'szw/vim-maximizer'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'roxma/vim-tmux-clipboard'
Plug 'yuttie/comfortable-motion.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
call plug#end()

set hidden

let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }
autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

let g:vroom_use_vimux = 1

colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1


" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c


augroup tmux                                                                                                                                                                                                                                                                                                                 
  autocmd!                                                                                                                                                                                                                                                                                                                 
  if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window " . expand("%:t"))                                                                                                                                                                                                         
    autocmd VimLeave,FocusLost * call system("tmux set-window-option automatic-rename")                                                                                                                                                                                                                                  
  endif
augroup END
