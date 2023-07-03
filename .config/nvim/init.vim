:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set expandtab
:set mouse=
:set splitright
:set splitbelow


call plug#begin()

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim'
Plug 'tc50cal/vim-terminal'
Plug 'preservim/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'plasticboy/vim-markdown'
Plug 'jpalardy/vim-slime'
Plug 'mbbill/undotree'

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-]> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-p> :FZF<CR>

nnoremap <F8> :TagbarToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <Leader>b :Buffers

autocmd filetype python set tabstop=4 | set softtabstop=4 | set shiftwidth=4
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++20 % -g -Wall -Wextra -DLOCAL -o %:r<CR>
autocmd filetype cpp nnoremap <F10> :!./%:r<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:slime_target = "tmux"

" --- Just Some Notes ---
"  " :PlugClean :PlugInstall :UpdateRemotePlugins
"  "
"  " :CocInstall coc-python
"  " :CocInstall coc-clangd
"  " :CocInstall coc-snippets
"  " :CocCommand snippets.edit... FOR EACH FILE TYPE

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
