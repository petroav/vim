set background=dark
colorscheme wombat256mod
set number
set cin
filetype plugin on
set nopaste

if has("gui_running")
  set guioptions=aiA " Disable toolbar, menu bar, scroll bars
endif " has("gui_running")
set splitright

set expandtab
set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on

" This will set a custom pylintrc file that is used to
" override default pylint settings
let g:pymode_lint_config = "$HOME/.pylintrc"

" This needs to be added because for .sql files the left and right
" arrow keys get mapped to something else.
let g:omni_sql_no_default_maps = 1

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Use :make to see syntax errors. (:cn and :cp to move around, :dist to see
" " all errors)
"set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\py_compile.compile(r'%')\"
"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
set makeprg=pylint\ --errors-only\ %:p
set errorformat=%f:%l:\ %m

" Open the TagList window on the right. NERDTree is on the left
let Tlist_Use_Right_Window = 1

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

" To enable pathogen (the vim package manger type thingy)
execute pathogen#infect()

" Enable Python mode using Pathogen
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Check the current directory, not the .git dir in CTRL-p
let g:ctrlp_working_path_mode = 'a'
  
" Also, for some reason CTRL-P goes full text search crazy when
" not in regex mode, so switch it to that.                                                                                                               
let g:ctrlp_regexp_search = 1

" MRU for files like in Intellij
nnoremap <C-e> :MRU<CR>
