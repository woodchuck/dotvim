set nocompatible

if has("autocmd")
  filetype indent plugin on
endif

" for powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

" use leader that is easier to type than \
let mapleader=","

set term=xterm-256color
colorscheme sexy-railscasts-256
set ls=2
set pastetoggle=<F2>
" command-t replaced with CtrlP
" seek replaced with easymotion
" neocomplcache replaced with neocomplete
let g:pathogen_disabled = ['command-t', 'nerdcommenter', 'seek', 'neocomplcache']
execute pathogen#infect()
call pathogen#helptags()
runtime macros/matchit.vim
au BufNewFile,BufRead *.html set filetype=php
au BufNewFile,BufRead *.etmpl set filetype=php
au BufNewFile,BufRead *.rb set filetype=ruby.rails

set wildmenu
set wildmode=longest,list,full
set wildignore=log/**,.git,vendor/bundle/**

" enter newline and remain in normal mode
map <S-Enter> o<Esc>
"map <CR> o<Esc>

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

" locations of my ctags files
set tags=~/depot/mainline/common/tags,~/git/rails/tags
" search up to root for files called 'tags'
set tags+=./tags;/
" rebuild ctags files
" common and rails source
nnoremap <Leader>r :!cd ~/depot/mainline/common; ctags -R .; cd -; cd ~/git/rails; ctags -R .; cd -<CR>
" recurse current directory
nnoremap <Leader>R :!ctags -R .<CR>

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

" highlight current line and column
set cursorline
"set cursorcolumn
"highlight CursorColumn ctermbg=233

" subtle highlight on column at 80 chars
set colorcolumn=80
:highlight colorcolumn ctermbg=234

" custom colors to highlight search results
"hi Search cterm=NONE ctermbg=lightcyan
hi Search cterm=reverse

" easy way to get back to normal mode
inoremap tn <Esc>
inoremap jj <Esc>

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

" List buffers
nnoremap <Leader>l :ls<CR>
" Go to last buffer accessed
nnoremap <Leader>g :e#<CR>

nnoremap <Leader>p :RainbowParenthesesToggle<CR>

nmap s <Plug>(easymotion-s)

" Substitute
"nnoremap <Leader>s :%s//<left>

" CtrlP
let g:ctrlp_map = '<Leader>f'
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPMixed<CR>
nnoremap <Leader>d :CtrlP .<CR>

" close buffer using bufkill plugin to preserve window
nnoremap <Leader>x :BD<CR>

" add changes to git index
nnoremap <Leader>w :Gwrite<CR>

let g:vimroom_background = "black"
let g:vimroom_width = 110

" center search result when nexting through them
"map N Nzz
"map n nzz

" indent with 2 spaces with zen coding
let g:user_zen_settings = {
\ 'indentation' : '  '
\}

"nnoremap <Leader>f :CommandTFlush<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Cruft from neocomplcache
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" dbext settings and profiles
"let g:dbext_default_profile_faculty = 'type=ORA:user=faculty:passwd=xxxxxxxx:host=shadev'
let g:dbext_default_profile_faculty = 'type=DBI:user=faculty:passwd=xxxxxxxx:driver=Oracle:conn_parms=tnsname'
let g:dbext_default_profile_webadmin_sha = 'type=DBI:user=webadmin:passwd=xxxxxxxx:driver=Oracle:conn_parms==tnsname'
let g:dbext_default_DBI_commit_on_disconnect = 0
let g:dbext_default_DBI_disconnect_onerror = 0

" Gonzui {{{
" TODO: search for word under the cursor
" TODO: determine which gonzui package to search based on :pwd

command! -nargs=1 Gonzui call s:Gonzui('<args>')

function! Gonzui(query)
  let grepprg = &grepprg
  let grepformat = &grepformat
  try
    let &grepprg = 'gonzui-search -n $*'
    let &grepformat = '%f:%l: %m'
    exe "grep '" . shellescape(a:query) . "'"
  finally
    let &grepprg = grepprg
    let &grepformat = grepformat
  endtry
endfunction

" Unite mappings
"let g:unite_source_find_max_candidates = 30000
"let g:unite_source_file_rec_max_candidates = 30000
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
" dvorak-friendly
"let g:unite_quick_match_table =
"      \ get(g:, 'unite_quick_match_table', {
"      \     'a' : 0, 'o' : 1, 'e' : 2, 'u' : 3, 'i' : 4, 'd' : 5, 'h' : 6, 't' : 7, 'n' : 8, 's' : 9,
"      \     "'" : 10, ',' : 11, '.' : 12, 'p' : 13, 'y' : 14, 'f' : 15, 'g' : 16, 'c' : 17, 'r' : 18, 'l' : 19,
"      \     '1' : 20, '2' : 21, '3' : 22, '4' : 23, '5' : 24, '6' : 25, '7' : 26, '8' : 27, '9' : 28, '0' : 29,
"      \ })
"nnoremap <leader>t :<C-u>Unite -start-insert file_rec/async:!<CR>
"nnoremap <leader>b :Unite -quick-match buffer<CR>
"let g:unite_source_history_yank_enable = 1
"nnoremap <leader>y :Unite history/yank<CR>
"let g:unite_source_grep_command = 'ag'
"let g:unite_source_grep_default_opts = '-i --noheading --nobreak'
"nnoremap <leader>/ :Unite grep:.<CR>
"nnoremap <leader>m :<C-u>Unite -quick-match file_mru<CR>

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" http://vimcasts.org/episodes/creating-mappings-that-accept-a-count/
nnoremap Q :normal n.<CR>

" remember useful regexes
source ~/.vim/regexlist

