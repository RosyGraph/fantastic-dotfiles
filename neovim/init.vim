" vim-plug plugins
call plug#begin()

" kemonofriends
Plug 'machakann/vim-colorscheme-kemonofriends'

" Base2Tone schemes
Plug 'atelierbram/Base2Tone-vim'

" Zenburn color scheme
Plug 'jnurmine/Zenburn'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" yin-yang theme
Plug 'pgdouyon/vim-yin-yang'

" lightline
Plug 'itchyny/lightline.vim'

" autopairs
Plug 'jiangmiao/auto-pairs'

" NERDCommenter
Plug 'scrooloose/nerdcommenter'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" vim-notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Vimwiki
Plug 'vimwiki/vimwiki'

" vimtex
Plug 'lervag/vimtex'

call plug#end()

" enable deoplete upon startup
let g:deoplete#enable_at_startup = 1

" neosnippet use C-k for completion and jumping
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" vimtex settings
let g:vimtex_view_method='skim'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:tex_flavor = "latex"
let g:vimtex_indent_enabled=0
autocmd Filetype tex setlocal tw=80

" Set space delims for NERDCommenter
let g:NERDSpaceDelims=1
let g:python_host_prog  = '/path/to/python'  " Python 2

" Automatic goimport
let g:go_fmt_command = "goimports"

" vim-notes setting
let g:notes_suffix = '.txt'
autocmd Filetype txt setlocal tw=80
autocmd Filetype note setlocal tw=80

" Vimwiki
autocmd Filetype vimwiki setlocal tw=80

" closes preview pane
set completeopt-=preview
set nocompatible

" Visual settings
set termguicolors
colorscheme Base2Tone_MotelDark
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'Base2Tone_Motel'
			\ }
set background=dark
syntax on

" vim-go shortcuts
nnoremap <leader>gt :GoTest<ENTER>
autocmd FileType go nmap <Leader>gi <Plug>(go-info)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gr <Plug>(go-run)

" General settings
filetype plugin on
filetype plugin indent on
set autoindent
set si
set tabstop=4
set noexpandtab
set shiftwidth=4
set nu
set splitright
set clipboard=unnamed
