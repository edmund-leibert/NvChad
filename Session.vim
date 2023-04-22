let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projects/Repositories/NvChad
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +21 init.lua
argglobal
%argdel
edit init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
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
exe '1resize ' . ((&lines * 37 + 30) / 60)
exe 'vert 1resize ' . ((&columns * 40 + 57) / 115)
exe '2resize ' . ((&lines * 37 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 74 + 57) / 115)
exe '3resize ' . ((&lines * 20 + 30) / 60)
argglobal
enew
file neo-tree\ filesystem\ [1]
balt init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
balt init.lua
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
let s:l = 21 - ((20 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 017|
wincmd w
argglobal
if bufexists(fnamemodify("term://~/Projects/Repositories/NvChad//15164:pwsh-preview&::toggleterm::1", ":p")) | buffer term://~/Projects/Repositories/NvChad//15164:pwsh-preview&::toggleterm::1 | else | edit term://~/Projects/Repositories/NvChad//15164:pwsh-preview&::toggleterm::1 | endif
if &buftype ==# 'terminal'
  silent file term://~/Projects/Repositories/NvChad//15164:pwsh-preview&::toggleterm::1
endif
balt init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 3 - ((2 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 03|
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 37 + 30) / 60)
exe 'vert 1resize ' . ((&columns * 40 + 57) / 115)
exe '2resize ' . ((&lines * 37 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 74 + 57) / 115)
exe '3resize ' . ((&lines * 20 + 30) / 60)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
