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
$argadd tra/russian/X\#ADDIAL_TMP.TRA
$argadd tra/english/x\#addial_tmp.tra
$argadd phase1/dlg/x\#addial.d
edit tra/russian/X\#ADDIAL_TMP.TRA
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
let s:l = 523 - ((3 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 523
normal! 0
wincmd w
argglobal
if bufexists("tra/english/x\#addial_tmp.tra") | buffer tra/english/x\#addial_tmp.tra | else | edit tra/english/x\#addial_tmp.tra | endif
balt tra/russian/X\#ADDIAL_TMP.TRA
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
let s:l = 540 - ((22 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 540
normal! 097|
wincmd w
argglobal
if bufexists("phase1/dlg/x\#addial.d") | buffer phase1/dlg/x\#addial.d | else | edit phase1/dlg/x\#addial.d | endif
balt tra/russian/X\#ADDIAL_TMP.TRA
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
let s:l = 1388 - ((9 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1388
normal! 0
wincmd w
exe '1resize ' . ((&lines * 26 + 39) / 78)
exe '2resize ' . ((&lines * 25 + 39) / 78)
exe '3resize ' . ((&lines * 23 + 39) / 78)
tabnext 1
badd +1 tra/russian/X\#ADDIAL_TMP.TRA
badd +1 tra/english/x\#addial_tmp.tra
badd +1 phase1/dlg/x\#addial.d
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
