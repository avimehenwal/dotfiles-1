"  _                                                _                 
" | | _____ _   _       _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___ 
" | |/ / _ \ | | |_____| '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
" |   <  __/ |_| |_____| | | | | | (_| | |_) | |_) | | | | | (_| \__ \
" |_|\_\___|\__, |     |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"           |___/                      |_|   |_|            |___/     
"
" with VIM you can practically program every key
"
" Leader key, like \, <space>, J
let g:mapleader="\<Space>"
" local to buffer <LocalLeader>
" let maplocalleader="\\"

nnoremap <Space> <Nop>
" save a LOT of keystrokes
" :help recursive-mapping
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

" works when you hit jj in insert mode unintentionally. saves some mess
" inoremap jk <Esc>
" inoremap kj <Esc>
inoremap jj <Esc>

" Easy CAPS, convert to upper-case
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB Key behavious to switch b/w open buffers

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>
" <TAB>: completion. ?
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if exists('g:vscode')
  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
else
  " Frequently Used Applications
  nnoremap <C-\> :Vifm<CR>
endif

" nnoremap Q :q!<CR>     interferes with existing Q Multiple Ex-mode commands

" Remove annoying highlight left after localsearch
nnoremap <silent> '/ :nohlsearch<CR>

" Markup blocks
" Make working with Markdown files easy
" ---------------------------------------------------------------------
inoremap <C-d> <ESC>yypA
" i_<C-m> interferes with Enter
" inoremap <expr> <M-m> FunctionCall()
" causes problems E523
" For gnome-terminal use CTRL-V ALT-<key> ... for META key mappings
" https://stackoverflow.com/a/10633069/1915935
" i_CTRL-V => insert next non-digit literally
" make META key mappings work on nvim
if has('nvim')
  inoremap <M-i> <ESC>Bi*<ESC>Ea*
  inoremap <M-b> <ESC>Bi**<ESC>Ea**
  inoremap <M-m> <ESC>Bi`<ESC>Ea`
else
  execute "set <M-m>=\em"
  inoremap i <ESC>Bi*<ESC>Ea*
  inoremap b <ESC>Bi**<ESC>Ea**
endif

" vscode like bindings
nnoremap <C-p> :GitFiles<CR>

" Use g for GIT and GOTO
" https://github.com/junegunn/fzf.vim/blob/master/README.md
"
nnoremap gb :Buffers<CR>
nnoremap gc :Commands!<CR>
nnoremap gh :History:<CR>
nnoremap gk :Maps<CR>
nnoremap gl :BCommits!<CR>
nnoremap gL :Commits!<CR>
nnoremap gm :Marks<CR>
nnoremap gp :edit $HOME/.vim/packages.vim<CR>
nnoremap gs :Snippets<CR>
nnoremap gv :edit $MYVIMRC<CR>
nnoremap g? :Helptags<CR>

" open vimrc
nnoremap sv :source $MYVIMRC<CR>


" GIT version Control with fugitive
" ---------------------------------------------------------------------------


" Function Keys
" cant use within byobu tmux interface
" ---------------------------------------------------
nnoremap <F1> :call ToggleHelpF1()<CR>
nnoremap <F2> :saveas
nnoremap <F3> :write<CR>
inoremap <F3> <ESC>:write<CR>a
" nnoremap <F4> :Ranger<CR>
nnoremap <F4> :Vifm<CR>
" nnoremap <S-F4> :NERDTreeToggle<CR>

nnoremap <F5> :edit<CR>
" discard local buffer changes and load from disk
nnoremap <S-F5> :edit!<CR>
" open git status in vertical split on left, unlike horizontal on top
nnoremap <F6> :call ToggleGitStatusF6()<CR>
nnoremap <S-F6> :Git
" <F7> lint_program equalprg
" <S-F7> vim formatprg Format program
" <F8> grepprg
nnoremap <F8> :Rg
nnoremap <S-F8> :grep

nnoremap <F9> :terminal<CR>
nnoremap <S-F9> :shell<CR>
" <F10> copyQ
nnoremap <F10> :!clear && %:p<Enter>
" <F11> Fullscreen
" <F12> run line under cursor
nnoremap <F12> :execute "!clear && " . getline('.')<CR>
" nnoremap <S-F12> :make
" run previous command
nnoremap <S-F12> :!!<CR>

function! ToggleHelpF1()
  if &buftype ==? 'help'
    execute 'helpclose'
  else
    " execute 'vertical help'
    execute 'Helptags'
  endif
endfunction

" use && and || for AND, OR with of conditions
function! ToggleGitStatusF6()
  if &filetype ==? 'fugitive'
    " cannot close last window! If this is the last window open
    execute 'close'
  else
    execute ':Git'
  endif
endfunction

" E523 Not allowed here
function! EncloseWord(symbol)
  "execute "normal! :<ESC>Bi" . a:symbol . "<ESC>Ea" . a:symbol
  :execute 'normal B'
  ":execute "normal" count . "w"
endfunction
