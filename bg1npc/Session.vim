let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/source/BG1NPC/bg1npc
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd tra/english/x\#branw.tra
$argadd tra/russian/X\#BRANW.TRA
$argadd phase1/dlg/x\#branw.d
edit tra/russian/X\#BRANW.TRA
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 26 + 39) / 78)
exe '2resize ' . ((&lines * 25 + 39) / 78)
exe '3resize ' . ((&lines * 23 + 39) / 78)
argglobal
if bufexists("tra/russian/X\#BRANW.TRA") | buffer tra/russian/X\#BRANW.TRA | else | edit tra/russian/X\#BRANW.TRA | endif
balt tra/english/x\#branw.tra
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 256 - ((10 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 256
normal! 0
wincmd w
argglobal
if bufexists("tra/english/x\#branw.tra") | buffer tra/english/x\#branw.tra | else | edit tra/english/x\#branw.tra | endif
balt tra/russian/X\#BRANW.TRA
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 246 - ((1 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 246
normal! 05|
wincmd w
argglobal
if bufexists("phase1/dlg/x\#branw.d") | buffer phase1/dlg/x\#branw.d | else | edit phase1/dlg/x\#branw.d | endif
balt tra/english/x\#branw.tra
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 410 - ((21 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 410
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 26 + 39) / 78)
exe '2resize ' . ((&lines * 25 + 39) / 78)
exe '3resize ' . ((&lines * 23 + 39) / 78)
tabnext 1
badd +1 tra/english/x\#branw.tra
badd +1 tra/russian/X\#BRANW.TRA
badd +1 phase1/dlg/x\#branw.d
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOS
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
