if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

call plug#begin()

Plug 'ngmy/vim-rubocop'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'mileszs/ack.vim'
Plug 'Shougo/neco-vim'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'
Plug 'chaoren/vim-wordmotion'
Plug 'andrewradev/splitjoin.vim'
Plug 'dominikduda/vim_current_word'
Plug 'editorconfig/editorconfig-vim'
Plug 'flazz/vim-colorschemes'
Plug 'gilligan/textobj-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'liuchengxu/vim-which-key'
Plug 'machakann/vim-highlightedyank'
Plug 'markonm/traces.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'ryanoasis/vim-devicons'
Plug 'tek/vim-textobj-ruby'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-tmux-runner'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
" Plug 'wellle/tmux-complete.vim'
Plug 'wincent/terminus'
Plug 'yggdroot/indentline'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

command! -nargs=+ -range=% -complete=command Global <line1>,<line2>call <SID>global_confirm(<q-args>)
command! -nargs=+ -range=% -complete=command G <line1>,<line2>call <SID>global_confirm(<q-args>)
function! s:global_confirm(args) range
  let args = a:args
  let sep = args[0]
  let [pat, cmd; _] = split(args[1:], '\v([^\\](\\\\)*\\)@<!%d' . char2nr(sep), 1) + ['', '']
  match none
  let options = ['throw "Global: Abort"', cmd, '', 'throw "Global: Abort"']
  let cmd = 'exe ''match IncSearch /\c\%''.line(''.'').''l''.@/.''/'''
  let cmd .= '| redraw'
  let cmd .= '| exe get(options, confirm("Execute?", "&yes\n&no\n&abort", 2))'
  try
    execute a:firstline . ',' . a:lastline . 'g'.sep.pat.sep.cmd
  catch /Global: Abort/
  finally
    match none
  endtry
endfunction

""" KEYBINDINGS
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
nnoremap ZQ :qa<cr>
inoremap jk <esc>
cnoremap jk <esc>
tnoremap jk <C-\><C-n>
nnoremap <C-j> 4j
nnoremap <C-k> 4k
noremap ' :<C-p>
noremap H ^
noremap L $
noremap p :set paste<CR>p:set nopaste<CR>
nmap s <Plug>(easymotion-s)
nnoremap <leader>feR :source /home/vincent/.vimrc <bar> PlugInstall<cr>
nnoremap <leader>fer :source /home/vincent/.vimrc<cr>
nnoremap <leader>ss :%s//g<left><left>
vnoremap <leader>ss :s//g<left><left>
nnoremap <leader>rr :%s/<C-r>0//g<left><left>
vnoremap <leader>rr :s/<C-r>0//g<left><left>
nnoremap <leader>SS :%S//g<left><left>
vnoremap <leader>SS :S//g<left><left>
nnoremap <leader>RR :%S/<C-r>0//g<left><left>
vnoremap <leader>RR :S/<C-r>0//g<left><left>
nnoremap <leader>co :g//z#.5 <bar> echo "=========="<home><right><right>
vnoremap <leader>dl :g/^$/d<cr>
noremap <leader>Y "Ryy
noremap <leader>D "Rdd
nnoremap + :cnext<cr>
nnoremap _ :cprev<cr>
nnoremap gm m
noremap m "_d
nnoremap mm "_dd
nnoremap M "_d$
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>
map <C-l> :NERDTreeToggle<CR>
nnoremap <localleader><localleader> :Make<CR>
nnoremap <leader>qq :tabclose<cr>
nnoremap <silent><esc> :nohl <bar> cclose<cr>
nnoremap <leader>wo :ToggleWorkspace<CR>
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf  :TestFile<CR>
nmap <silent> <Leader>ts  :TestSuite<CR>
nnoremap <silent> <CR> :TestLast<CR>
nmap <silent> <Leader>TT  :TestLast<CR>
nmap <silent> <Leader>tv  :TestVisit<CR>
nmap <leader>ff :Files<CR>
nnoremap <C-f> :GFiles?<CR>
nnoremap <C-b> :Buffers<CR>
nmap <Leader>bt :BTags<CR>
nmap <Leader>ta :Tags<CR>
nmap <Leader>bl :BLines<CR>
nmap <Leader>LL :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Ag<CR>
nmap <C-s> :Ack<space>
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
nnoremap <C-n> gt
nnoremap <C-p> gT
noremap <leader><cr> :<C-p><cr>
nnoremap <silent> K :LspHover<CR>
nnoremap <localleader>c :LspCodeAction<CR>
nnoremap <silent> <localleader>d :LspPeekDefinition<CR>
nnoremap <silent> <localleader>r :LspRename<CR>
nnoremap <silent> <localleader>f :LspDocumentFormat<CR>
nnoremap <silent> gd :te ri <C-r><C-w><CR>
vnoremap <silent> gd y:te ri <C-r>0<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:endwise_no_mappings = 1
imap <C-X><CR>   <CR><Plug>AlwaysEnd
imap <expr> <CR> (pumvisible() ? "\<C-Y>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
nnoremap <leader>bc :g/binding/d<cr>
nnoremap <leader>BC :bufdo G/binding/d<cr>
let g:VtrUseVtrMaps = 1
        " <leader>rr   |   VtrResizeRunner<cr>
        " <leader>ror  |   VtrReorientRunner<cr>
        " <leader>sc   |   VtrSendCommandToRunner<cr>
        " <leader>sl   |   VtrSendLinesToRunner<cr>
        " <leader>or   |   VtrOpenRunner<cr>
        " <leader>kr   |   VtrKillRunner<cr>
        " <leader>fr   |   VtrFocusRunner<cr>
        " <leader>dr   |   VtrDetachRunner<cr>
        " <leader>ar   |   VtrReattachRunner<cr>
        " <leader>cr   |   VtrClearRunner<cr>
        " <leader>fc   |   VtrFlushCommand<cr>
nnoremap <leader>dd :VtrSjndCtrlD<CR>
nnoremap <leader>FF :VtrSendFile<CR>
nmap <leader>) ysiW)hx
vmap <leader>) S)hx

let @p="Orequire 'pry'; binding.pry\<esc>"
let @j="A;jkJ"
let @w="krX"
let @x="jrX"
let @a="hrX"
let @d="lrX"
let @e="klrX"
let @q="khrX"
let @z="jhrX"
let @c="jlrX"

""" LSP
let g:lsp_insert_text_enabled = 0
let g:lsp_text_edit_enabled = 0
let g:preview_float = 0

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
"     \ 'name': 'necovim',
"     \ 'whitelist': ['vim'],
"     \ 'completor': function('asyncomplete#sources#necovim#completor'),
"     \ }))
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bundle exec solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

""" WORKSPACE
set noswapfile
let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_untrailspaces = 0
let g:workspace_session_disable_on_args = 1

let g:vtr_filetype_runner_overrides = {
      \ 'ruby': 'pry -Isrc {file}',
      \ }

let g:VtrPercentage = 50
let g:VtrOrientation = "h"
let test#strategy = "vtr"

let g:fzf_buffers_jump = 1

""" AESTHETICS
set nofoldenable
set shiftround
colorscheme nord
set scrolloff=10
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 12.0
set nowrap

set number
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme='tomorrow'
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1

set signcolumn=no
set colorcolumn=80
highlight ColorColumn ctermbg=8
highlight link GitGutterAddLineNr Function
highlight link GitGutterChangeLineNr ALEWarningSign
highlight link GitGutterChangeDeleteLineNr ALEWarningSign
highlight link GitGutterDeleteLineNr ALEErrorSign
highlight link LspInformationText Comment
highlight link LspHintText Comment
let g:gitgutter_highlight_linenrs = 1

""" TMUX

augroup tmux
  autocmd!
  if exists('$TMUX')
    autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave,FocusLost * call system("tmux set-window-option automatic-rename")
  endif
augroup END

""" RUBY
augroup ruby
  autocmd!
  autocmd BufLeave *.rb silent! !ctags -R
  autocmd FileType ruby setlocal omnifunc=lsp#complete
augroup END
