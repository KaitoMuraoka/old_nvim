# My initVim
## What is this?


# 導入しているプラグイン

| 名称 | Plugin名 | URL |
| ---- | -------- | --- |
|ステータスライン | vim-airline  | https://github.com/vim-airline/vim-airline |
|ファイルエクスプローラー|The NERDTree|https://github.com/preservim/nerdtree|
|曖昧検索|fzf|https://github.com/junegunn/fzf　
|Git連携|vim-fugitive|https://github.com/tpope/vim-fugitive
|Git差分検索|vim-gitgutter|https://github.com/airblade/vim-gitgutter
|多言語パック|vim-polyglot|https://github.com/sheerun/vim-polyglot
|Linter | Asynchronous Lint Engine |https://github.com/dense-analysis/ale
|Linterの結果をステータスラインに表示| lightline-ale |
|スニペット|　UltiSnips | https://github.com/SirVer/ultisnips
|スニペット| snipMate & UltiSnip Snippets | https://github.com/honza/vim-snippets
|プログラム実行|neoterm|https://github.com/kassio/neoterm
|入力補完|coc.nvim|https://github.com/neoclide/coc.nvim
|自動で閉じかっこ|Auto Pairs|https://github.com/jiangmiao/auto-pairs
|コメントアウト|commentary.vim|https://github.com/tpope/vim-commentary
|escで全角→半角へ|vim-im-select|https://github.com/brglng/vim-im-select
|PlantUMLのPreviewer|plantuml-previewer.vim|https://github.com/weirongxu/plantuml-previewer.vim

## 言語関係
| プログラミング言語 | Plugin名 | URL |
| ---- | -------- | --- |
|gitignore|https://github.com/iwataka/gitignore.vim|https://qiita.com/iwataka/items/016dfe7e86e3dee5b15a
|Flutter|vim-flutter|https://github.com/thosakwe/vim-flutter
|Swift|Swift.vim|https://github.com/keith/swift.vim
|Markdown|Vim Markdown|https://github.com/preservim/vim-markdown
|Docker|Coc|https://github.com/josa42/coc-docker |


## 使用方法
### 曖昧検索
`:help fzf-vim-commands`を実行すると使用可能になったコマンドの一覧が確認できる。

### Git連携
`:Gdiffsplit`や`:Gblame`を使うことができる

### Linter
警告(`--`)とエラー(`>>`) が左端に表示される。
`control + k`,`control + j`で警告とエラーの箇所に移動できる

### 定義元ジャンプ
`gd`を押すと、関数定義元にジャンプ

`gr`を押すと、参照一覧を表示

`K`を押すとドキュメントをホバー表示できる

### ファイルエクスプローラー
`:NERDTreeToggle`を実行するとファイルエクスプローラーが表示される。

操作方法は`?`を押して表示されるヘルプで確認できる。

### プログラム実行
NeoVimでは`:terminal`コマンドでターミナルエミュレータを起動できる。

neotermでは`:Tnew`コマンドで新しいターミナルエミュレータを起動できる。

### コメントアウト
`gcc`と入力すると、現在の行をコメントアウトする。
ビジュアルモードで行を選択してから、`gc`を入力すると、選択ぎょうをコメントアウトできる。
コメントアウトされた行に対して実行すれば、コメントアウトを解除できる。

### Markdownの使い方
https://howpon.com/22203
