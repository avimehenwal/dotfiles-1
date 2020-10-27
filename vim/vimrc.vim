" AUTHOR : avimehenwal
" FILE   : $HOME/.vimrc  $MYVIMRC
" ORIGIN : Sat 28 Apr 05:01:05 IST 2018
"
" Don't seek mastery, seek proficiency
"
" start vim with zero configuration
" -N              									Not fully Vi compatible: 'nocompatible'
" -u <vimrc>      									Use <vimrc> instead of any .vimrc
" vi -Nu NORC <filepath>
"
" Order of rc-file detection
" 1. $VIMINIT												Environment Variable
" 2. $HOME/.vimrc
" 3. $HOME/.vim/vimrc
" 4. $EXINIT												Environment Variable
" 5. $HOME/.exrc
" 6. $VIMRUNTIME/defaults.vim
"
" Try to keep it Language agnostic
" All FileType specific configs go either into ftplugin dir or autocommands

" linter Tools :retab

" set some environment variable
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" Runtimepath
set rtp+=$HOME/.fzf/bin/fzf
set rtp+=$HOME/.vim/plugged/gruvbox

" look for Project specific .vimrc files
" https://superuser.com/questions/532593/how-do-i-get-vim-to-automatically-load-vimrc-config-from-the-current-directory
set exrc
set secure

" Refactor - use plugin/ftplugin directories
" Manually sourced vim files, sometimes order matters


" Understanding vim directory structure
" ------------------------------------------------------------------------------------------
" Whatever goes into plugin is loaded whenever vim starts whereas what you put in ftplugin
" is only loaded for the specific filetype it corresponds to (so if you have a folder there
" called python all the files there will be loaded when you open a python file. In autoload
" you should have the functions corresponding to the the scripts defined in plugin. 
" The functions here will only be loaded when called by the first time.
" 
" In after you should put settings that you want to change from the normal plugin loading.
" As an example suppose you like the settings that some plugin for latex gives you,
" but it redefined a mapping that you had in your .vimrc.
" You can revert this with autocommands or by putting the correct definitions in after.
"
" https://stackoverflow.com/questions/14248335/please-explain-vims-configuration-directories-hierarchy
" https://learnvimscriptthehardway.stevelosh.com/chapters/42.html


" vim Session-management
"":mksession ~/mysession.vim
"":source ~/mysession.vim
""$ vim -S ~/mysession.vim

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
""set viminfo=h,'500,<10000,s1000,/1000,:1000
""set viminfo='1000,f1,<500  "lines, marks
"
"	I   The environment variable VIMINIT (see also |compatible-default|) (*)
"	    The value of $VIMINIT is used as an Ex command line.
"	II  The user vimrc file(s):
"		    "$HOME/.vimrc"	   (for Unix) (*)
"		    "$HOME/.vim/vimrc"	   (for Unix) (*)
"		    "s:.vimrc"		   (for Amiga) (*)
"		    "home:.vimrc"	   (for Amiga) (*)
"		    "home:vimfiles:vimrc"  (for Amiga) (*)
"		    "$VIM/.vimrc"	   (for Amiga) (*)
"		    "$HOME/_vimrc"	   (for Win32) (*)
"		    "$HOME/vimfiles/vimrc" (for Win32) (*)
"		    "$VIM/_vimrc"	   (for Win32) (*)
"		    "$HOME/config/settings/vim/vimrc"	(for Haiku) (*)
