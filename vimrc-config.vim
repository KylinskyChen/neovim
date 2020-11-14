
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件自定义配置；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc 插件系统； 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 安装 coc 插件； 
let g:coc_global_extensions = [
    \ 'coc-marketplace',
	\ 'coc-actions',
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-todolist',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
	\ 'coc-vetur',
	\ 'coc-yaml',
	\ 'coc-yank',
	\ 'coc-cmake'
	\ ]

set hidden
set updatetime=1000
set shortmess+=c

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" TAB 补全功能；
inoremap <silent><expr> <TAB> 
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ctrl + 空格调出自动补全；
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 查找上下一个报错；
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 查看调用关系；
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 查看文档说明；
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 光标处单词高亮；
autocmd CursorHold * silent call CocActionAsync('highlight')

" 当前变量重命名；
nmap <leader>rn <Plug>(coc-rename)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack 全局文本搜索；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>F :Ack!<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf 文件检索；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :FZF 唤起；

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF 检索工具；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键 <leader>f 直接唤起；

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch 检索工具；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline 底部状态条；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change-colorscheme 页面主题；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prepare-code 预定义代码片段；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-edit 文本编辑工具；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y :CopyText<cr>
nnoremap D :DeleteText<cr>
nnoremap C :ChangeText<cr>
nnoremap <leader>r :ReplaceTo<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cpp-mode 代码编辑工具；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>
nnoremap <leader><leader>t dd :GenTryCatch<cr>
xnoremap <leader><leader>t d :GenTryCatch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-buffer 缓冲区；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree 目录树；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree-git-plugin 目录树 git 插件；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar 函数列表；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabular 自动对齐的插件；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gv 快速查看 git 仓库；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Table-mode markdown 表格支持；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:table_mode_corner = '|'
let g:table_mode_border=0
let g:table_mode_fillchar=' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MouseType 修改鼠标类型；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[5 q" "SR = REPLACE mode
let &t_EI.="\e[5 q" "EI = NORMAL mode (ELSE)

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 消除鼠标滚动时的抖动；
" noremap <ScrollWheelDown><ScrollWheelUp> <ScrollWheelDown>
" noremap <ScrollWheelUp><ScrollWheelUp> <ScrollWheelUp>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown-toc 目录配置；
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :GenTocGFM<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1  " enable AutoSave on Vim echodoc_enable_at_startup











" echodoc.vim
let g:echodoc_enable_at_startup = 1 

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" markdown
" markdown-preview.vim 的配置；
" let g:markdown_preview_sync_google_chrome_path = "/usr/bin/google-chrome"
" let g:mkdp_path_to_chrome = "google-chrome"
" " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" " 如果设置了该参数, g:mkdp_browserfunc 将被忽略
" let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" " vim 回调函数, 参数为要打开的 url
" let g:mkdp_auto_start = 0
" " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" " markdown 文件的时候打开一次
" let g:mkdp_auto_open = 1
" " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" " 览窗
" let g:mkdp_auto_close = 1
" " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" " 自动关闭预览窗口
" let g:mkdp_refresh_slow = 0
" " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" " 更新预览
" let g:mkdp_command_for_global = 0
" " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" " 文件可以使用改命令
" let g:mkdp_open_to_the_world = 0
" " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
" " 默认只监听本地（127.0.0.1），其他计算机不能访问

" markdown-preview.nvim 的配置；
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

nmap <silent> <F7> <Plug>MarkdownPreview
imap <silent> <F7> <Plug>MarkdownPreview
nmap <silent> <F8> <Plug>StopMarkdownPreview
imap <silent> <F8> <Plug>StopMarkdownPreview

let g:mkdp_brower = 'google-chrome'
autocmd Filetype markdown noremap ,m :MarkdownPreview<CR>
autocmd Filetype markdown noremap ,ms :MarkdownPreviewStop<CR>

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" vim + latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" 格式化 Json 文件
map <F4><Esc>:%!python -m json.tool<CR>


let g:previm_open_cmd = 'google-chrome'

" nmap <silent> <F7> <Plug>PrevimOpen<CR>
" imap <silent> <F7> <Plug>PrevimOpen<CR>

" vimwiki
" let g:vimwiki_list = [{'path': '~/wiki/test/', 'syntax': 'markdown', 'ext': '.md', 'auto_toc': 0, 'auto_tags': 0}]
" 插入目录；
" map <F5> :VimwikiTOC<CR>

" Yggdroot/indentLine
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

