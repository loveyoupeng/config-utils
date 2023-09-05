setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
set foldlevel=1
set nu

map <C-K> :py3f /usr/bin/clang-format-11.py<cr>
imap <C-K> <c-o>:py3f /usr/bin/clang-format-11.py<cr>

set expandtab
set shiftwidth=2
set softtabstop=2

set colorcolumn=120
hi ColorColumn ctermbg=5

set cursorline
set cursorcolumn

hi CursorLine term=reverse gui=NONE cterm=bold ctermbg=0
hi CursorLineNr cterm=reverse
hi CursorColumn ctermbg=0

set path+=**
set spell
set spell spelllang=en_us
set encoding=utf-8
let g:ale_linters={'python':['pylint','mypy','flake8']}
let g:ale_lint_on_save = 1
let g:ale_fixers={'python': ['autoflake', 'autoimport', 'isort', 'pycln', 'black', 'autopep8', 'pyflyby','reorder-python-imports','ruff','yapf'], '*':['remove_trailing_lines','trim_whitespace', 'add_blank_lines_for_python_control_statements']}
let g:ale_fix_on_save = 1
let g:snips_author='Yunpeng Li'
let g:snips_email='loveyoupeng@gmail.com'
let g:snips_github='https://github.com/loveyoupeng'
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
colorscheme dracula
let g:black_use_virtualenv = 1
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py
augroup end

function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/bin/clang-format-11.py
endfunction
autocmd BufWritePre *.h,*.c,*.cc,*.cpp,*.java,*.cs call Formatonsave()
