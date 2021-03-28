" plugins {{{
call plug#begin()

Plug 'machakann/vim-colorscheme-kemonofriends'
Plug 'chriskempson/base16-vim'
" Plug 'pbrisbin/vim-colors-off'
" Plug 'atelierbram/Base2Tone-vim'
" Plug 'atelierbram/vim-colors_atelier-schemes'
" Plug 'cideM/yui'
" Plug 'noahfrederick/vim-hemisu'
" Plug 'noahfrederick/vim-noctu'
" Plug 'camgunz/amber'
" Plug 'RosyGraph/amber'
" Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'neovim/nvim-lspconfig'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'psf/black'
Plug 'eagletmt/neco-ghc'
Plug 'jaspervdj/stylish-haskell'
Plug 'Chiel92/vim-autoformat'
Plug 'vimwiki/vimwiki'
Plug 'whonore/Coqtail'
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
autocmd FileType java setlocal omnifunc=v:lua.vim.lsp.omnifunc

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

let g:go_fmt_command = "goimports"
" }}}
" r markdown {{{

autocmd BufWritePost *.rmd :call RMakeRmd("default")
let R_rconsole_width = 0
let R_rconsole_height = 15

" }}}
" haskell {{{

autocmd BufWritePre *.hs :Autoformat
autocmd FileType haskell let b:autoformat_autoindent = 0
autocmd Filetype haskell setlocal expandtab

" }}}
" scheme {{{

autocmd FileType scheme nnoremap <silent> <buffer> <leader>r :!scheme --quiet < % <CR>

" }}}
" misc filetypes {{{

let g:notes_suffix = '.txt'
autocmd Filetype txt setlocal tw=80
autocmd Filetype note setlocal tw=80
autocmd FileType vimwiki setlocal tw=80
autocmd FileType vim setlocal foldmethod=marker
autocmd BufWritePre *.c :Autoformat
let R_in_buffer=1
let R_assign=0

function! g:CoqtailHighlight()
	hi def CoqtailChecked cterm=reverse	ctermfg=fg
	hi def CoqtailSent ctermbg=62
endfunction

" }}}
" misc {{{

set rtp+=/usr/local/opt/fzf
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
autocmd BufWritePre *.java execute ':Autoformat'

" }}}
" visual {{{

syntax on

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" hi Normal guibg=NONE ctermbg=NONE
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
set linebreak
set completeopt-=preview
:tnoremap <Esc> <C-\><C-n>

" }}}

