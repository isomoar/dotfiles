set foldlevel=0 
" set foldmethod=marker 

" Environment {{{

if has('vim_starting')
  " quicker startup
  if has('nvim')
  else
    set nocompatible
    set encoding=utf-8
    set laststatus=2
    set viminfo='1000,s100,h
  endif

  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endi

set background=dark

endif

" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-abolish'

  " Theme
  Plug 'w0ng/vim-hybrid'
  Plug 'Yggdroot/indentLine'
  Plug 'mhinz/vim-startify'
   Plug 'vim-airline/vim-airline'
  " Plug 'itchyny/lightline.vim'
  
  Plug 'vim-airline/vim-airline-themes'
  Plug 'nanotech/jellybeans.vim'
  Plug 'ryanoasis/vim-devicons'

  " Motions and actions
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'Julian/vim-textobj-variable-segment'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-repeat'
  Plug 'wellle/targets.vim'
  Plug 'rhysd/clever-f.vim'

  " Plug 'tpope/vim-unimpaired'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'jreybert/vimagit'
  Plug 'rhysd/conflict-marker.vim'
  Plug 'junegunn/gv.vim' 

  " Tools
  if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  endi
  "
  Plug 'sgur/vim-editorconfig'
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'zxqfl/tabnine-vim'
  Plug 'mbbill/undotree'

  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'cloudhead/neovim-fuzzy'
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  " Filetypes
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/html5.vim'
  Plug 'elzr/vim-json'
  Plug 'idris-hackers/idris-vim'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'davidhalter/jedi'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'leafgarland/typescript-vim'
  Plug 'jason0x43/vim-js-indent'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'yuezk/vim-js'
  Plug 'jparise/vim-graphql'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'elmcast/elm-vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'alexlafroscia/postcss-syntax.vim'
  Plug 'exu/pgsql.vim'
  Plug 'ap/vim-css-color'

  " Snippets
  Plug 'honza/vim-snippets'
    " Plug 'epilande/vim-react-snippets'  
  "
  if executable('tmux')
    " Navigate between vim and tmux splits
    Plug 'christoomey/vim-tmux-navigator'
    nnoremap <silent><C-h> <C-\><C-n> :TmuxNavigateLeft<cr>
    nnoremap <silent><C-j> <C-\><C-n> :TmuxNavigateDown<cr>
    nnoremap <silent><C-k> <C-\><C-n> :TmuxNavigateUp<cr>
    nnoremap <silent><C-l> <C-\><C-n> :TmuxNavigateRight<cr>
    " Restore `FocusLost` and `FocusGained` events in tmux
    " Plug 'tmux-plugins/vim-tmux-focus-events'
  endif
call plug#end()

function! s:has_plug(name)
  return &runtimepath =~ a:name
endfunction

" }}}

" General: {{{
set number " Precede each line with its line number
set cursorline " Highlight the current line
set history=1000 " Remember a lot of stuff
set wildmenu " Enhance command-line completion
set wildmode=longest:full,full
set wildignorecase
set belloff=all

set noshowmode " Don't display native status line

set ignorecase " Ignore case in search

set hlsearch " Highlight searches
set incsearch

" If a pattern contains an uppercase letter
" it is case sensitive, otherwise, it is not
set smartcase

set backspace=indent,eol,start " Allow backspace in insert mode

set updatecount=0 " Disable swap files

set hidden " Enable abandon buffer if modified

" set clipboard=unnamedplus " Use the OS clipboard by default

" Set <space> to leader
set shell=/usr/local/bin/zsh

set spelllang=en,ru " Spell language

set nostartofline " Keep the cursor in the same place when switching buffers

set autoread " Automatically refresh file if it was changed external program

set modifiable " Able to modify buffer with :argdo
set write

set spelllang=en,ru " Spell check

lang en_US.UTF-8 " Fixes copy to clipboard with wrong encoding issue

set formatoptions+=n1 " Turn off auto-commenting behaviour on new line. Does not work!

" open new split panes to right
set splitright

" Better display for messages
set cmdheight=2

" if executable('rg')
"   set grepprg=rg\ --vimgrep\ --no-heading\ -HS\ --line-number
"   set grepformat=%f:%l:%c:%m
" elseif executable('ag')
"   set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ -C0
"   set grepformat=%f:%l:%c:%m
" elseif executable('pt')
"   set grepprg=pt\ /nogroup\ /nocolor\ /smart-case\ /follow
"   set grepformat=%f:%l:%m
" endif
" command! -nargs=* Grep grep <args>

" }}}

" Formatting {{{

if has('vim_starting')
  set nowrap
  set linebreak
  set breakindent
  set breakindentopt=shift:2,sbr
  set showbreak=?
  set autoindent
  set expandtab
  set shiftwidth=2
  set softtabstop=-1
endif

" }}}

" " {{{ Key Mappings

let mapleader=' '
let maplocalleader='\'
nnoremap <leader>v :vsplit ~/.vimrc<CR>
nnoremap <leader><space>r :so ~/.vimrc<CR>
nnoremap <leader><leader>q :qa!<cr>
nnoremap <leader>b :bd<cr>
nnoremap <leader>w :w<cr>

" Switch buffers
nnoremap <silent> H :bp<CR>
nnoremap <silent> L :bn<CR>

" Quit buffer
nnoremap <leader>q :bd<CR>

nnoremap <silent> L :bn<CR>

" Force j and k to work on display lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" Window mappings
noremap <right> <C-w>>
noremap <left> <C-w><
noremap <up> <C-w>+
noremap <down> <C-w>-

" Return to normal mode from insert mode
inoremap fd <Esc>
inoremap jj <Esc>

" Add ';' at the end of line
nnoremap <leader>; mqg_a;<esc>`q

" Add ',' at the end of line
nnoremap <leader><leader>; mqg_a,<esc>`q

" Move cursor to the end of line in insert mode
inoremap <C-e> <Esc>A

" Press enter for newline without insert
nnoremap <cr> o<esc>

" Clear search (highlight)
nnoremap <silent> <leader>k :noh<cr>

" Copy / paste

nnoremap <C-y> "*y
xnoremap <C-y> "*y
nnoremap <C-p> :set paste<CR>"*]p:set nopaste<CR>
nnoremap <C-P> :set paste<CR>"*]P:set nopaste<CR>
xnoremap <C-p> :<C-U>set paste<CR>"*]p:set nopaste<CR>
xnoremap <C-P> :<C-U>set paste<CR>"*]P:set nopaste<CR>
xnoremap p "0p

xnoremap y y`]
xnoremap p p`]
nnoremap p p`]

xnoremap D y'>p

nnoremap vv ^vg_

nnoremap <silent> s :set opfunc=PasteReplace<CR>g@
vnoremap <silent> s :<C-U>call PasteReplace(visualmode(), 1)<CR>

function! PasteReplace(type, ...)
  if a:0
    normal! gv"0p
  elseif a:type == 'line'
    normal! '[V']"0p
  else
    normal! `[v`]"0p
  endif
endfunction

if s:has_plug('clever-f.vim')
    nmap ; <Plug>(clever-f-repeat-forward)
endi

if executable('tmux')
  tnoremap <silent><C-h> <C-\><C-n> :TmuxNavigateLeft<cr>
  " tnoremap <silent><C-j> <C-\><C-n> :TmuxNavigateDown<cr>
  " tnoremap <silent><C-k> <C-\><C-n> :TmuxNavigateUp<cr>
  tnoremap <silent><C-l> <C-\><C-n> :TmuxNavigateRight<cr>
endif
" }}}

if  s:has_plug('defx')
  augroup defx_config
    autocmd!
    autocmd FileType defx call s:defx_my_settings()
  augroup END

  " Show Defx
  nnoremap <silent> <leader>d :Defx -split=vertical -winwidth=50 -direction=topleft<cr>
  " Expand current file in Defx buffer
  nnoremap <silent> - :Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>

  function! s:defx_my_settings() abort
    " Defx mappings
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    " nnoremap <silent><buffer><expr> l
    " \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> rm
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> mv
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> -
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'

    nnoremap <silent><buffer><expr> <leader>re
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
  endfunction

endi
" FZF {{{
" Exclude files and directories in CTRL+P search
set wildignore+=*/node_modules/*,*/coverage/*

" FZF mappings
" nnoremap <C-f> :FuzzyOpen<CR>
nnoremap <C-f> :Clap files<CR>
nnoremap <C-i> :FzfBuffers<CR>
nnoremap <leader>a :FzfRg<CR>
nnoremap <silent> <BS> :FzfHistory:<CR>


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_height = '30%'
let g:fzf_command_prefix = 'Fzf'
let g:fzf_history_dir = '~/.local/share/fzf-history'

" " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)


" }}}

" Undotree {{{
if s:has_plug('undotree')
  let g:undotree_WindowLayout = 2
  nnoremap <leader>u :UndotreeToggle<cr>
  " persistent_undo
  set undodir=~/.config/nvim/undo
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
" }}}

" COC {{{

if s:has_plug('coc.nvim')
  let g:coc_global_extensions = ['coc-tsserver',  'coc-eslint',  'coc-go', 'coc-json', 'coc-css']

  " You will have bad experience for diagnostic messages when it's default 4000.
  " set updatetime=300

  " don't give |ins-completion-menu| messages.
  " set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion and naviate to the next item
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> <leader>s <Plug>(coc-range-select)
  xmap <silent> <leader>s <Plug>(coc-range-select)

 " Remap for do codeAction of current line
 nmap <leader>ca  <Plug>(coc-codeaction)
 " Fix autofix problem of current line
 nmap <leader>af  <Plug>(coc-fix-current)
 

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>


  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  " makes `<leader>f` format the visually selected range, and you can use 
  " `<leader>fap` to format a paragraph.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>ff  <Plug>(coc-format)

  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)

  inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'
endif

" }}}

" Vim-clap {{{
if s:has_plug('vim-clap')
  nmap <leader>cg :Clap grep ++query=<cword><cr>
  nmap <leader>cf :Clap files<cr>
  let g:clap_theme = 'material_design_dark'
endif
" }}}

" Other plugin settings {{{

if s:has_plug('lightline')

  let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }
endif
if s:has_plug('vim-airline')
  let g:airline_theme='raven'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tmuxline#enabled = 0
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
endif

if s:has_plug('conflict-marker.vim')
    " disable the default highlight group
    let g:conflict_marker_highlight_group = ''

    " Include text after begin and end markers
    let g:conflict_marker_begin = '^<<<<<<< .*$'
    let g:conflict_marker_end   = '^>>>>>>> .*$'

    highlight ConflictMarkerBegin guibg=#2f7366
    highlight ConflictMarkerOurs guibg=#2e5049
    highlight ConflictMarkerTheirs guibg=#344f69
    highlight ConflictMarkerEnd guibg=#2f628e
endif

" open help vertically
autocmd FileType help wincmd L

if has('vim_starting')
  colorscheme hybrid
endif

if s:has_plug('vim-closetag') 
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
    let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ }
endif

" }}}

if s:has_plug('vim-go')
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
endif
