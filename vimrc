"This allows you to move beyond the last character of a line with the movemt
" keys
" set virtualedit=onemore
" Stop line splitting in vim
set textwidth=0
"This enables number on the left side of the document
set number
" Automatic Reloading of .vimrc

autocmd! bufwritepost .vimrc source %

" Better copy & paste

set pastetoggle=<F2>
"
if !has('nvim')
    " set ttymouse=xterm2
    set clipboard=unnamed
else
    set clipboard+=unnamedplus " nvim only it seems?
endif

"Mouse & backspace

set mouse=a "On osx press Alt and click
set bs=2	"supposedly fixes some backspace problem

"Rebind leader key,	not useful for me right now as i dont know what the tuttorial means
let mapleader = ","

" Nerdtree Binding
map <C-n> :NERDTreeToggle<CR>

" Bind nohl
" Removes  high light of your last search
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>

" Not useful to me to bind nohl either NOTE: from starting with this comment i will write
" my notes after the instructions


" Quick save command
" noremap <C-z> :update<CR>
" vnoremap <C-z> <C-C>:update<CR> 
" inoremap <C-z> <C-O>:update<CR>
" Not useful to me right now but seems like this is the standard wawy to remap a key binding 



" Quick quit command
" noremap <leader>e :quit<CR> "quit current window
" noremap <leader>E :qa!<CR> "quit all windows
" Seems like theres some exceptions like this to remapping keys



" Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w+movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Easier movement between tabs
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>


" map sort function to a key
" vnoremap <leader>s :sort<cr>
" sort function sort consecutive lines in order, hightlight the first elemente of each line is needed


" easier movement of codeblocs
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
" the diffrence with the original one is that this one makes the block remain highlighted for multiple indentation or de-indentation


"" Show whitespace
"" Must be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight  ExtraWhitespace ctermbg=red guibg=red 	"This lines seem to be causing an error
" au InsertLeave * match ExtraWhitespace /\s\+$/ 	" This line is causing an error too Theres a problem i cant find with this 2 lines
" seems like it cannot find whitespace.
" deletes whitespace or shows white spaces we aren't aware of due
" to ppl using script that deletes white spaces and can cause problems to
" the program.


" Color Scheme command line commands to execute outside this file
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors "This are command line for terminal
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"color ron
" color wombat256mod	
" color ron " This is the default color scheme of vim
color inkpot
" color grb256
"color codeschool
"color dracula " This is the default color scheme of vim
" this is a test


" Enable syntax highlighting
" You need to reload the file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number " show line number
set tw=99	"width of document (used by gd)
set nowrap	" Don't automatically wrap on load
set fo-=t	" Don't automatically wrap text when typing
set colorcolumn=80 	" usually one does not want to write python lines longer than 80 characters
highlight ColorColumn ctermbg=233


" Easier formatting of paragraphs
vmap Q gq 	
nmap Q gqap
" what this does is format a long paragraph that goes longer than the 80 charactes column
" jus position the cursor on any part of the paragraph and pre Q upper case.
" careful with this one as it will put on the same line paragraphs that are shorter than 80 chars
" Useful settings
set history=700
set undolevels=700

set title " For Linux Kernel Hacking
" Real programmers dont use TAB'S but spaces
" Python Setup 4-space tabs
" set tabstop=4 
" set softtabstop=4
" set shiftwidth=4
" Linux Kernel Setup 8-space tabs, other indentations are not accepted
set tabstop=8
set softtabstop=8
set shiftwidth=8
" set expandtab
" The Following is also recommended for Linux kernel hacking:
set noexpandtab
" Have read recommendations of this but better investigate
" what each of this one's do exactly.
" The next line are general no matter how many spaces we use.
set shiftround


"Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files -they trigger to many events
" for filesystem watchers
set nobackup
set nowritebackup
set noswapfile
" INVESTIGATE as i am no sure i want this one


" Setup pathogen to manage your plugins
"  mkdir -p ~/.vim/autoload ~/.vim/bundle
"  curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/p
" now you can  install plugins into a .vim/bundle/plugins-name/folder
" execute pathogen#infect()
""call pathogen#infect()
execute pathogen#infect()
call pathogen#helptags()

" ###################### PYTHONG IDE SETUP ###################################



" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git 
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigation through omnicomplete option list
" See http://copypastefromgithubs vimrc
" set completeopt=longest,menuone

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif 
    return a:action
endfunction

"
inoremap <silent><C-j> <C-R>=OmniPopup('j')<C-R>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<C-R>



" python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
" the past 2 lines go together on one line on terminal one space in between them
set nofoldenable


" Configuration to make Eclim work
set nocompatible
filetype plugin on " careful with this one it counters one of pythonns configs above
" watch waht impact it has

filetype plugin indent on

" Set autoindent for all files
set autoindent

" Synstastic recommended starting settings from:
" https://github.com/vim-syntastic/syntastic#installation
" Also syntasic need syntax checker to be installed for the specific language
" you want it to support, guide here: 
" https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt
"  When enabled this YouCompleteme setting will disable the C-family checkers in
"  Syntastic, that is why we must unset it.
let g:ycm_show_diagnostics_ui = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic c-gcc checker specific configuration
let g:syntastic_c_remove_include_errors = 1
" let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_compiler = "gcc"
let g:syntastic_c_compiler_options = "-std=gnu89"
let g:syntastic_c_checkers=['checkpatch']
" let g:syntastic_c_no_default_include_dirs = 1
" let g:syntastic_c_checkers=['gcc', 'checkpatch', 'sparse']
" let g:syntastic_c_checkers=['checkpatch', 'sparse']
"let g:syntastic_c_checkers=['sparse']
" TODO: Create and test the sparse checker with a configuration file
"  If gcc is to work with sparse the following 2 config lines are recommended
" let g:syntastic_c_sparse_post_args="-gcc-base-dir " .
"         \ system("gcc -v 2>&1 | sed -n '/^Reading specs/ { s#.* /#/#; s#/[^/]*$##; p; }'")
" " let g:syntastic_c_checkers=['gcc', 'sparse']
" let g:syntastic_c_checkers=['sparse', 'gcc']

" END OF Synstastic Configuration
"
" Custom ILS Functions
" Settings 2 spaces instead of tabs for shell scripts 
function TwoSps()
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
  echom 'Tabs set to expand to 2 spaces'
endfunction

function FourSps()
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal expandtab
  echom 'Tabs set to expand to 4 spaces'
endfunction

" Making powerline work
" set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" set  rtp+=/home/shadowthrone/.local/lib/python3.8/site-packages/powerline/bindings/vim/

"""" Making airline work
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" POWERLINE CONFIG
" set  rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/
" set laststatus=2
