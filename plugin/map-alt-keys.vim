" Mapping Alt-keys for Terminal
"
" Maintainer:   DeaR <nayuri@kuonn.mydns.jp>
" Last Change:  21-Apr-2016.
" License:      MIT License {{{
"     Copyright (c) 2016 DeaR <nayuri@kuonn.mydns.jp>
"
"     Permission is hereby granted, free of charge, to any person obtaining a
"     copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to permit
"     persons to whom the Software is furnished to do so, subject to the
"     following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
"     OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
"     THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_map_alt_keys') || has('win32') || has('gui_running')
  finish
endif
let g:loaded_map_alt_keys = 1

let s:save_cpo = &cpo
set cpo&vim

" <M-M>
if !exists('g:map_alt_M')
  let g:map_alt_M = 0
endif

" <M-O>
if !exists('g:map_alt_O')
  let g:map_alt_O = 0
endif

" <M-[>
if !exists('g:map_alt_left_sq')
  let g:map_alt_left_sq = 0
endif

" NumPad
if !exists('g:map_keypad')
  let g:map_keypad = 1
endif

function! s:map_alt_keys()
  for i in range(0x21, 0x7e)
    if (g:map_alt_M || i != 0x4d) && (g:map_alt_O || i != 0x4f) && (g:map_alt_left_sq || i != 0x5b)
      execute "set <Char-" . (i + 0x80) . ">=\<Esc>" . escape(nr2char(i), "\"|")
    endif
  endfor

  if g:map_keypad
    execute "set <kPlus>=\<Esc>Ok"
    execute "set <kMinus>=\<Esc>Om"
    execute "set <kDivide>=\<Esc>Oo"
    execute "set <kMultiply>=\<Esc>Oj"
    execute "set <kEnter>=\<Esc>OM"
    execute "set <kPoint>=\<Esc>On"
    execute "set <k0>=\<Esc>Op"
    execute "set <k1>=\<Esc>Oq"
    execute "set <k2>=\<Esc>Or"
    execute "set <k3>=\<Esc>Os"
    execute "set <k4>=\<Esc>Ot"
    execute "set <k5>=\<Esc>Ou"
    execute "set <k6>=\<Esc>Ov"
    execute "set <k7>=\<Esc>Ow"
    execute "set <k8>=\<Esc>Ox"
    execute "set <k9>=\<Esc>Oy"
  endif
endfunction
call s:map_alt_keys()


let &cpo = s:save_cpo
unlet s:save_cpo
