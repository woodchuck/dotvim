set nocompatible

" for powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

" use leader that is easier to type than \
let mapleader=","

set term=xterm-256color
colorscheme railscasts
set ls=2
set pastetoggle=<F2>
let g:pathogen_disabled = []
call pathogen#runtime_append_all_bundles()
runtime macros/matchit.vim
au BufNewFile,BufRead *.html set filetype=php
au BufNewFile,BufRead *.etmpl set filetype=php
au BufNewFile,BufRead *.rb set filetype=ruby.rails

let g:debuggerPort = 9002
" close minibufexpl when debugging to avoid window carnage
"let g:debuggerMiniBufExpl = 1

" enter newline and remain in normal mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" don't unload hidden buffers
set hidden

set ignorecase
set smartcase
let g:php_sql_query = 1
let g:php_noShortTags = 1
let g:php_folding = 1

" show command being typed in the status bar
set showcmd

"set mouse=a
let g:CommandTMaxFiles=30000
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" location of my ctags file
set tags=~/git/sha/common/tags
" rebuild ctags file
nnoremap <Leader>r :!cd ~/git/sha/common; ctags -R .; cd -<CR>

" show hidden chars
set list
set listchars=tab:→\ ,trail:·
" unobtrusive colors for these chars
hi NonText ctermfg=239
hi SpecialKey ctermfg=239

" line numbers on by default
set number
" toggle line numbers
nnoremap <Leader>ln :set number!<CR>
" unobtrusive color for line numbers
hi LineNr ctermfg=239

set tabstop=4

" highlight current line
set cul

" custom colors to highlight search results
"hi Search cterm=NONE ctermbg=lightcyan
hi Search cterm=reverse

" easy way to get back to normal mode
inoremap tn <Esc>

" Swap ; and :  Convenient.
nnoremap ; :
" nnoremap : ; breaks command-t
nnoremap \ ;

" Highlight things that we find with the search
set hlsearch

" Space will toggle folds!
nnoremap <space> za

" open folds by default
set foldlevelstart=20

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \p \n \g : go previous/next/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Substitute
nnoremap <Leader>s :%s//<left>

" close buffer
nnoremap <Leader>c :bd<CR>

" add changes to git index
nnoremap <Leader>w :Gwrite<CR>

" help EasyMotion not conflict with Command-T
let g:EasyMotion_leader_key = '<Leader>,'

let g:vimroom_background = "black"
let g:vimroom_width = 110

" center search result when nexting through them
"map N Nzz
"map n nzz

" indent with 2 spaces with zen coding
let g:user_zen_settings = {
\ 'indentation' : '  '
\}

nnoremap <Leader>f :CommandTFlush<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" dbext settings and profiles
"let g:dbext_default_profile_faculty = 'type=ORA:user=faculty:passwd=xxxxxxxx:host=shadev'
let g:dbext_default_profile_faculty = 'type=DBI:user=faculty:passwd=xxxxxxxx:driver=Oracle:conn_parms=tnsname'
let g:dbext_default_profile_webadmin_sha = 'type=DBI:user=webadmin:passwd=xxxxxxxx:driver=Oracle:conn_parms==tnsname'
let g:dbext_default_DBI_commit_on_disconnect = 0
let g:dbext_default_DBI_disconnect_onerror = 0
