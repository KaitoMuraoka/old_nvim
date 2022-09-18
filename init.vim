call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim' "color
Plug 'itchyny/lightline.vim' "ステータスライン
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } "ファイルエクスプローラ
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "↑の2つは曖昧検索
Plug 'tpope/vim-fugitive' "Git連携
Plug 'airblade/vim-gitgutter' "Git差分表示
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot' "多言語パック
Plug 'dense-analysis/ale' "Linter
Plug 'maximbaz/lightline-ale' "Linterの結果をステータスラインに表示
Plug 'SirVer/ultisnips' "スニペット
Plug 'honza/vim-snippets'
Plug 'kassio/neoterm' "プログラム実行
Plug 'neoclide/coc.nvim', {'branch': 'release'} "入力補完
Plug 'jiangmiao/auto-pairs' "自動で閉じ括弧
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
" gitgutter
Plug 'iwataka/gitignore.vim'
" Flutter Plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
"Swift Plugin
Plug 'keith/swift.vim'
" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
call plug#end()

set number
"set termguicolors
" airblade/vim-gitgutter
set updatetime=100
set completeopt=menuone,noinsert

let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" joshdick/onedark.vim
colorscheme onedark
" itchyny/lightline.vim
let g:lightline = {'colorscheme': 'onedark'}

" dense-analysis/ale
let g:ale_set_highlights = 0
let g:ale_linters = {'python': ['flake8']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \ }
let g:ale_fix_on_save = 1

" let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:lightline = {'colorscheme': 'onedark'}
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
let g:lightline.active = {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified'],
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
  \   ]
  \ }

" scrooloose/nerdtree
nmap <C-e> :NERDTreeToggle<CR>
" junegunn/fzf.vim
nmap <C-p> :History<CR>



" kassio/neoterm
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
let g:neoterm_autoscroll=1
tnoremap <silent> <C-w> <C-\><C-n><C-w>
nnoremap <silent> <C-n> :TREPLSendLine<CR>j0
vnoremap <silent> <C-n> V:TREPLSendSelection<CR>'>j0

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Markdown
let g:previm_open_cmd = 'open -a Safari'

let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
nmap  gd (coc-definition)
