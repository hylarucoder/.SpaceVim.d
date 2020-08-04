" ############## Default Setting Start ########################
let g:spacevim_colorscheme = 'NeoSolarized'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_enable_guicolors = 1
let g:spacevim_statusline_separator = 'arrow'
let g:spacevim_statusline_inactive_separator = 'arrow'
let g:spacevim_buffer_index_type = 4
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_mode = 1
let g:spacevim_filemanager = 'nerdtree'
let g:spacevim_snippet_engine = 'ultisnips'

" ############## Default Setting End   ########################

let g:spacevim_custom_plugins = [
  \ ['lilydjwg/colorizer'],
  \ ['wsdjeg/mdctags.rs'],
  \ ]

call SpaceVim#layers#load('default')
call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('colorscheme')
call SpaceVim#layers#load('fzf')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('github')
call SpaceVim#layers#load('edit')
call SpaceVim#layers#load('tools')



call SpaceVim#layers#load('lang#dockerfile')
call SpaceVim#layers#load('lang#go')

call SpaceVim#layers#load('lang#graphql')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('lang#vue')

call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('lang#sh')



" let g:spacevim_custom_plugins = [
"   \ ['fatih/vim-go',               { 'on_ft' : 'go'}],
"   \ ['keith/swift.vim',            { 'on_ft' : 'swift'}],
"   \ ['leafgarland/typescript-vim', { 'on_ft' : 'typescript' }],
"   \ ]
"
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" {{ coc {{
let g:coc_config_home = '~/.SpaceVim.d/'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  se
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" `<leader>f` already taken by SpaceVim 
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" }} coc }}el
