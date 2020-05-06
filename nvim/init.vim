" vim-plug plugins
call plug#begin()

"
" colorschemes
"

" vim-colorscheme-switcher
" Plug 'xolox/vim-colorscheme-switcher'
" Plug 'xolox/vim-misc'

" colour sampler pack
" Plug 'vim-scripts/Colour-Sampler-Pack'

" base16 colors
Plug 'chriskempson/base16-vim'

" Base2Tone schemes
" Plug 'atelierbram/Base2Tone-vim'

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

" java-language-server
" Plug 'georgewfraser/java-language-server'

" vim-snippets
Plug 'honza/vim-snippets'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'artur-shaik/vim-javacomplete2'

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
" Plug 'dansomething/vim-eclim'

"
" note taking
"

" Vimwiki
Plug 'vimwiki/vimwiki'

call plug#end()

" autocomplete and snippets

" LSP
" let g:LanguageClient_serverCommands = {
    " \ 'java': ['/usr/local/bin/jdtls', '-data', getcwd()],
    " \ }

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#auto_completion_start_length = 1
set omnifunc=syntaxcomplete#Complete
call deoplete#custom#var('omni', 'input_patterns', {
	  \ 'tex': g:vimtex#re#deoplete
	  \})

" function SetLSPShortcuts()
  " nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  " nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  " nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  " nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  " nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  " nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  " nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  " nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
" endfunction()

" augroup LSP
  " autocmd!
  " autocmd FileType java call SetLSPShortcuts()
" augroup END
" use C-k for completion and jumping
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" JavaComplete
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

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
autocmd Filetype tex nmap <Leader>wc :VimtexCountWords <CR>
let g:vimtex_quickfix_latexlog = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'packages' : {
          \   'default' : 0,
          \ },
          \}

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

autocmd FileType go nmap <Leader>gt <Plug>(go-test)
autocmd FileType go nmap <Leader>gi <Plug>(go-info)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gr <Plug>(go-run)
autocmd FileType go nmap <Leader>gb <Plug>(go-build)

" fancy go terminal
let g:go_fmt_command = "goimports"
let g:go_term_mode = "vsplit"
function! ReuseVimGoTerm(cmd) abort
    for w in nvim_list_wins()
        if "goterm" == nvim_buf_get_option(nvim_win_get_buf(w), 'filetype')
            call nvim_win_close(w, v:true)
            break
        endif
    endfor
    execute a:cmd
endfunction

let g:go_term_enabled = 1
let g:go_term_mode = "silent keepalt rightbelow 15 split"
let g:go_def_reuse_buffer = 1

autocmd FileType go nmap <silent> <leader>gr :call ReuseVimGoTerm('GoRun')<Return>

" eclim

autocmd FileType java nnoremap <silent> <buffer> <leader>r :Java %<cr>
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

colorscheme base16-gruvbox-dark-pale
" set background=dark
set termguicolors
set noshowmode
" let g:lightline = {
			" \ 'colorscheme': 'base16-atelier-forest-light'
			" \ }
" autocmd colorscheme * hi! Normal ctermbg=none guibg=NONE
syntax on

" set space delims for NERDCommenter
let g:NERDSpaceDelims=1

" run the current python file
autocmd FileType python nnoremap <silent> <buffer> <leader>r :!python3 % <CR>

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
set relativenumber
set splitright
set clipboard=unnamed
set ignorecase smartcase

" leave terminal mode with ESC
:tnoremap <Esc> <C-\><C-n>

" turn off scratch preview
set completeopt-=preview

" better window mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" add folding behavior
" augroup remember_folds
  " autocmd!
  " autocmd BufWinLeave * mkview
  " autocmd BufWinEnter * silent! loadview
" augroup END

