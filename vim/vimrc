" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" I'm using VIM
set nocompatible

" use comma as leader
let mapleader = ","
" use jj instead of ESC
inoremap jj <Esc>

" All the Google stuff
if filereadable(expand('~/.vim/google/vimrc'))
  source ~/.vim/google/vimrc
endif

" use Vundle to install external plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

" Some vars.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:tmux_navigator_save_on_switch = 2

" run gofmt when saving go source
autocmd FileType go AutoFormatBuffer gofmt
function! GoColums()
  let &l:colorcolumn=0
endfunction
autocmd FileType go call GoColums()


filetype plugin indent on
" show line and column number in status line
set ruler
" show the mode in status line
set showmode
" show line numbers
set number
" line numbers are 5 chars wide
set numberwidth=5
" show relative line numbers for easy movment
set relativenumber
" set background color for cols > 80 so that the border looks nice
let &colorcolumn=join(range(81,320),",")
" highlight the line where the cursor is
set cursorline
" always show the status line
set laststatus=2
" mouse? hmm...
set mouse=a
" show special character
set list
" remap special characters to something more fancy
set listchars=tab:»\ ,extends:»,nbsp:·,trail:·
" use both * and + registers for yanks
set clipboard=unnamed,unnamedplus
" match also < and >
set matchpairs+=<:>
" always show 5 lines of context when scrolling
set scrolloff=5
" make filename tab completion more shell like
set wildmode=longest,list,full
set wildmenu

" syntax highlighting
syntax on

" colors
set background=dark
" this need .vim/colors/solarized.vim
colorscheme solarized

highlight trailingWhitespace ctermbg=red
highlight TabLine ctermfg=DarkGrey ctermbg=Black cterm=NONE
highlight TabLineFill ctermfg=DarkGrey ctermbg=Black cterm=NONE
highlight TabLineSel ctermfg=White ctermbg=DarkYellow cterm=NONE
highlight SpecialKey ctermfg=DarkGrey ctermbg=NONE cterm=NONE
