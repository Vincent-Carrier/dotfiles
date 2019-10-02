if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
nnoremap ZQ :qa<cr>
inoremap jk <esc>
cnoremap jk <esc>
nnoremap <leader>feR :source /home/vincent/.vimrc <bar> PlugInstall<cr>
nnoremap <leader>fer :source /home/vincent/.vimrc<cr>
nnoremap <leader>ss :%S//g<left><left>
vnoremap <leader>ss :S//g<left><left>
nnoremap <leader>rr :%S/<C-r>0//g<left><left>
vnoremap <leader>rr :S/<C-r>0//g<left><left>
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
nnoremap -- :bprev<cr>
nnoremap == :bnext<cr>
nnoremap `` :bdelete<cr>
nnoremap <silent><esc> :nohl<cr>
nmap <leader>pi :call pry#insert()<cr>
nnoremap <leader>wo :ToggleWorkspace<CR>
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <Leader>tn :call RunNearestSpec()<CR>
map <Leader>tt :call RunLastSpec()<CR>
map <Leader>ta :call RunAllSpecs()<CR>
nmap <Leader>f :Files<CR>
nmap <Leader><leader> :GFiles<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>h :History<CR><Paste>
nmap <Leader>bt :BTags<CR>
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
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nnoremap <leader><cr> :<C-p><cr>
nnoremap <localleader>c :LspCodeAction<CR>
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <localleader>d :LspPeekDefinition<CR>
nnoremap <silent> <localleader>r :LspRename<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>

let @p="orequire 'pry'; binding.pryjk"
let @j="A;jkJ"
let @w="krX"
let @x="jrX"
let @a="hrX"
let @d="lrX"
let @e="klrX"
let @q="khrX"
let @z="jhrX"
let @c="jlrX"

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish'
Plug 'thaerkh/vim-workspace'
Plug 'editorconfig/editorconfig-vim'
Plug 'thoughtbot/vim-rspec'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dominikduda/vim_current_word'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'markonm/traces.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tek/vim-textobj-ruby'
Plug 'michaeljsmith/vim-indent-object'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'gilligan/textobj-gitgutter'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'wellle/targets.vim'
Plug 'raimondi/delimitmate'
Plug 'machakann/vim-highlightedyank'
Plug 'andrewradev/splitjoin.vim'
Plug 'justinmk/vim-sneak'
Plug 'flazz/vim-colorschemes'
Plug 'liuchengxu/vim-which-key'
Plug 'szw/vim-maximizer'
" Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'wincent/terminus'
Plug 'tmux-plugins/vim-tmux'
Plug 'roxma/vim-tmux-clipboard'
Plug 'yuttie/comfortable-motion.vim'
Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

set hidden

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bundle exec solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif
autocmd FileType ruby setlocal omnifunc=lsp#complete

let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='tomorrow'
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1

let g:rspec_command = "!rspec -fd {spec}"

augroup tmux
  autocmd!
  if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave,FocusLost * call system("tmux set-window-option automatic-rename")
  endif
augroup END
