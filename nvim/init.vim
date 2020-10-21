" plugins {{{
call plug#begin()

" Plug 'pbrisbin/vim-colors-off'
" Plug 'atelierbram/Base2Tone-vim'
Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'cideM/yui'
Plug 'noahfrederick/vim-hemisu'
Plug 'RosyGraph/vim-noctu'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'artur-shaik/vim-javacomplete2'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'autozimu/LanguageClient-neovim', {
	" \ 'branch': 'next',
	" \ 'do': 'bash install.sh',
	" \ }
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'eagletmt/neco-ghc'
Plug 'jaspervdj/stylish-haskell'
Plug 'Chiel92/vim-autoformat'
Plug 'vimwiki/vimwiki'

call plug#end()
" }}}
" custom bindings {{{

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
autocmd FileType java nmap <Leader>gt :!./gradlew test <CR>
autocmd FileType java nmap <Leader>gr :!./gradlew run <CR>
nnoremap <leader>ex :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>rm :let @m=system('reducematrix ' . shellescape(getreg('m')))<CR>

" }}}
" completion {{{

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#auto_completion_start_length = 1
autocmd FileType java setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
lua <<EOF
require'nvim_lsp'.jdtls.setup{}
EOF

" }}}
" python {{{

autocmd BufWritePre *.py execute ':Black'
let g:black_linelength=80
autocmd FileType python nnoremap <silent> <buffer> <leader>r :!python3 % <CR>

" }}}
" latex {{{

set conceallevel=1
let g:vimtex_view_method='skim'
let g:tex_conceal='abdmg'
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_latexmk_continuous = 1
" autocmd BufReadPost *.tex set syntax=context
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
let g:vimtex_indent_enabled=0
autocmd Filetype tex setlocal tw=80
autocmd Filetype tex nmap <Leader>wc :VimtexCountWords <CR>
let g:vimtex_quickfix_ignore_filters = [
          \ 'overfull',
          \ 'underfull',
          \ 'packages',
          \]

" }}}
" go {{{

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

" }}}
" haskell {{{

autocmd BufWritePre *.hs :Autoformat
autocmd FileType haskell let b:autoformat_autoindent = 0
autocmd Filetype haskell setlocal expandtab

" }}}
" misc filetypes {{{

let g:notes_suffix = '.txt'
autocmd Filetype txt setlocal tw=80
autocmd Filetype note setlocal tw=80
autocmd FileType vimwiki setlocal tw=80
autocmd FileType vim setlocal foldmethod=marker
autocmd BufWritePre *.c :Autoformat

" }}}
" misc {{{

set rtp+=/usr/local/opt/fzf
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
autocmd BufWritePre *.java execute ':Autoformat'

" }}}
" visual {{{

syntax on
set termguicolors
colorscheme Atelier_CaveDark

hi Normal guibg=NONE ctermbg=NONE
" highlight clear Conceal

let g:NERDSpaceDelims=1

" }}}
" general {{{

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
set cursorline
set completeopt-=preview
:tnoremap <Esc> <C-\><C-n>

" }}}

