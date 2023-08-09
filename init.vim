call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' "ステータスライン
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } "ファイルエクスプローラ
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "曖昧検索
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
Plug 'alvan/vim-closetag' "HTMLの閉じタグ
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-commentary' "コメントアウト
Plug 'brglng/vim-im-select' "Vim-IM-select: url https://vimawesome.com/plugin/vim-im-select
"gitgutter
Plug 'iwataka/gitignore.vim'
" Flutter Plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
"Swift Plugin
Plug 'keith/swift.vim'
" Markdown
"Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'ekalinin/Dockerfile.vim' " Dockerfile.vim
Plug 'wakatime/vim-wakatime' " WakaTime
call plug#end()

set number
"set termguicolors
" airblade/vim-gitgutter
set updatetime=100
set completeopt=menuone,noinsert

let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" joshdick/onedark.vim
"colorscheme onedark
" itchyny/lightline.vim
"let g:lightline = {'colorscheme': 'onedark'}

" dense-analysis/ale
let g:ale_set_highlights = 0
let g:ale_linters = {'python': ['flake8']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \   'ruby': ['rubocop']
  \ }
let g:ale_fix_on_save = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" scrooloose/nerdtree
nmap <C-e> :NERDTreeToggle<CR>
" junegunn/fzf.vim
nmap <C-p> :History<CR>

"VIM-IM-SELECT
let g:im_select_default = 'com.apple.keylayout.ABC'

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

"定義元ジャンプ
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Markdown
let g:previm_open_cmd = 'open -a Safari'

let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
nmap  gd (coc-definition)

"alvan/vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" RuboCopを保存と自動に起こす
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
