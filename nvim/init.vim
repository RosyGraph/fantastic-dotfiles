" vim-plug plugins
call plug#begin()

"
" colorschemes
"

"base16 colors
Plug 'chriskempson/base16-vim'

" Base2Tone schemes
Plug 'atelierbram/Base2Tone-vim'

" yin-yang theme
" Plug 'pgdouyon/vim-yin-yang'

" kemonofriends
" Plug 'machakann/vim-colorscheme-kemonofriends'

"
"status bar
"

" lightline
" Plug 'itchyny/lightline.vim'
" Plug 'mike-hearn/base16-vim-lightline'

"
" autocomplete
"

" vim-snippets
Plug 'honza/vim-snippets'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'artur-shaik/vim-javacomplete2'

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" autopairs
Plug 'jiangmiao/auto-pairs'

"
" language-specific tools
"

" alchemist
Plug 'slashmili/alchemist.vim'

" vim-elixir
Plug 'elixir-editors/vim-elixir'

" vimtex
Plug 'lervag/vimtex'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" NERDCommenter
Plug 'scrooloose/nerdcommenter'

" vim-eclim
Plug 'dansomething/vim-eclim'

"
" note taking
"

" Vimwiki
Plug 'vimwiki/vimwiki'

" vim-notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

call plug#end()

" autocomplete and snippets

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
set omnifunc=syntaxcomplete#Complete

" use C-k for completion and jumping
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" JavaComplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" vimtex

let g:vimtex_view_method='skim'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
" let g:vimtex_compiler_progname = 'nvr'
" let g:vimtex_view_automatic = 0
" let g:vimtex_compiler_method='latexmk'
let g:vimtex_indent_enabled=0
autocmd Filetype tex setlocal tw=80

" vim-notes

let g:notes_suffix = '.txt'
autocmd Filetype txt setlocal tw=80
autocmd Filetype note setlocal tw=80

" Vimwiki
autocmd Filetype vimwiki setlocal tw=80

" elixir
autocmd BufWritePost *.exs,*.ex silent :!mix format %
syntax match elixirCustomOperators "<-" conceal cchar=←
syntax match elixirCustomOperators "->" conceal cchar=→

syntax match elixirCustomOperators "==" conceal cchar=≡
syntax match elixirCustomOperators "!=" conceal cchar=≠
syntax match elixirCustomOperators "<=" conceal cchar=≤
syntax match elixirCustomOperators ">=" conceal cchar=≥

highlight  link elixirCustomOperators Operator
highlight! link Conceal Operator

autocmd FileType elixir nmap <Leader>mt :Mix test <CR>

" vim-go

nnoremap <leader>gt :GoTest<ENTER>
autocmd FileType go nmap <Leader>gi <Plug>(go-info)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gr <Plug>(go-run)
autocmd FileType go nmap <Leader>gb <Plug>(go-build)
let g:go_fmt_command = "goimports"

" eclim

autocmd FileType java nnoremap <silent> <buffer> <leader>jj :Java %<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>jt :JUnit %<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>pr :ProjectRefresh<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>pl :ProjectList<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>pb :ProjectBuild<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java nnoremap <silent> <buffer> nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
let g:EclimProjectTreeAutoOpen=1

" fzf
set rtp+=/usr/local/opt/fzf

" visual

colorscheme Base2Tone_DesertLight
" set background=dark
" set termguicolors
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'Base2Tone_DesertLight'
			\ }
" autocmd colorscheme * hi! Normal ctermbg=none guibg=NONE
syntax on

" set space delims for NERDCommenter
let g:NERDSpaceDelims=1

" general settings
" let g:python3_host_prog  = '/usr/local/bin/python3'
filetype plugin on
filetype plugin indent on
set autoindent
set si
set tabstop=4
set noexpandtab
set shiftwidth=4
set number
set splitright
set clipboard=unnamed
set ignorecase smartcase

" leave terminal mode with ESC
:tnoremap <Esc> <C-\><C-n>

" add folding behavior
" augroup remember_folds
  " autocmd!
  " autocmd BufWinLeave * mkview
  " autocmd BufWinEnter * silent! loadview
" augroup END

