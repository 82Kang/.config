vim.cmd [[
fu! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
  return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    " let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
    " let s .= ' |'
    endif
  endfor
  return s
endfu
set tabline=%!MyTabLine()
]]

vim.cmd [[
  "Map gl to :tablast (cycle b/w two vim tabs)
  if !exists('g:lasttab')
      let g:lasttab = 1
  endif
  nmap gl :exe "tabn ".g:lasttab<CR>
  au TabLeave * let g:lasttab = tabpagenr()
]]
