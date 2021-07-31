call plug#begin()

" Airline
Plug 'vim-airline/vim-airline'

"Sneak
Plug 'justinmk/vim-sneak'

" Telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'

" FZF 
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Doesn't work over ssh :( but still useful
Plug 'junegunn/fzf.vim'

" Gruvbox
Plug 'morhetz/gruvbox'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Vim fugitive
Plug 'tpope/vim-fugitive'

"Vim smooth scrolling
Plug 'psliwka/vim-smoothie'

" Nerdcommenter
Plug 'preservim/nerdcommenter'

" Highlighted yank
Plug 'machakann/vim-highlightedyank'

" Vimspector
Plug 'puremourning/vimspector'

" Vim surround
Plug 'tpope/vim-surround'

call plug#end()

"" General
" General remaps
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap Y y$

" Set search and replace as global by default instead of just the first
" instance
:set gdefault

:set nu rnu
:set tabstop=4
:set shiftwidth=4
:set ignorecase
:set smartcase
:set so=3 " Scroll ofset

" Add [count]jk to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Quickfix lists
nmap <leader>lo :copen<cr>
nmap <leader>lc :ccl<cr>
nmap <leader>ln :cn<cr>
nmap <leader>lp :cp<cr>

"General windows settings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-w><C-m> <C-w>\|<C-w>_
nnoremap <C-w><C-w> <C-w>=

" General settings but for COC
set hidden
set nobackup
set nowritebackup
set noswapfile

" Clear highlight
nmap <leader>ch :<C-U>noh<cr>

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

"" Telescope
" nnoremap <leader>p <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" FZF
" Set the path of fzf
set rtp+=~/.fzf 
" Go to file
nmap <leader>p <cmd>FZF<cr>
" Go to buffer
nnoremap <leader>b :Buffers<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" FZF vim - prefer to use fzf since it works over ssh
" None of these keybindings will work over ssh unfortunately. Not sure why
:nmap <leader>fa :Rg<cr>
" find selection
nmap <leader>fp <cmd>GFiles<cr>
vmap <leader>fv y:Rg <C-r>0<cr>

let g:fzf_preview_window = ['up:80%', 'ctrl-/']

"" COC
let g:coc_global_extensions = [
			\ 'coc-pairs',
			\ 'coc-clangd',
			\ 'coc-rls',
			\ 'coc-toml'
			\ ]
	
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Search the whole project for symbols
nnoremap <silent><nowait> <leader>cs :<C-u>CocList -I symbols<cr> 
nnoremap <silent><nowait> <leader>cr :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <leader>cn :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>cp :<C-u>CocPrev<CR>
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

nnoremap <silent><nowait> <leader>o :<C-u>CocCommand clangd.switchSourceHeader<cr> 
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent><nowait> <leader>rn <Plug>(coc-rename)
nmap <silent><nowait> <leader>cq <Plug>(coc-fix-current)
nnoremap <silent><nowait> <leader>ad :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>ao :<C-u>CocList outline<cr>
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

set cmdheight=2
set updatetime=5000

""Vim fugitive - Also doesn't work over ssh sadly
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"" Theming - Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
" set termguicolors
" autocmd vimenter * nested colorscheme gruvbox
set background=dark 

"" Vim-smoothie
let g:smoothie_speed_linear_factor = 12
let g:smoothie_speed_constant_factor = 15

"" Vim sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1 " Case insensitive search

"" Vim airline
let g:airline#extensions#tabline#enabled = 1

"" Nerdcommenter
filetype plugin on
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1 " Add space after comment

nmap <leader>cc <plug>NERDCommenterToggle
xmap <leader>cc <plug>NERDCommenterToggle

"" Highlighted yank
let g:highlightedyank_highlight_duration = 200

"" Vimspector
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
" nmap <leader>de :VimspectorEval
nmap <Leader>de <Plug>VimspectorBalloonEval
xmap <Leader>de <Plug>VimspectorBalloonEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutputlet g:vimspector_install_gadgets = [ 'CodeLLDB' ]
nmap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>dc :call vimspector#ClearBreakpoints()<CR>

" Breakpoint control
nmap <leader>ds <Plug>VimspectorStepOver
nmap <leader>di <Plug>VimspectorStepInto
nmap <leader>du <Plug>VimspectorStepOut
nmap <leader>dg <Plug>VimspectorContinue

map <leader>dk <Plug>VimspectorUpFrame
nmap <leader>dj <Plug>VimspectorDownFrame
