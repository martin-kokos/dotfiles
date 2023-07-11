let g:python3_host_prog = '/home/x/.virtualenvs/neovim/bin/python'

call plug#begin()

" status bar for vim
"Plug 'vim-airline/vim-airline'
" official theme repository for vim-airline
"Plug 'vim-airline/vim-airline-themes'

" file browser
Plug 'preservim/nerdtree'
" show git file status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Show different filetype icons different color
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Nerd fonts
Plug 'ryanoasis/vim-devicons'
" A collection of common configurations for Neovim's built-in language server client
Plug 'neovim/nvim-lspconfig'
" Auto completion plugin for nvim
Plug 'hrsh7th/nvim-compe'
" treesitter - quick syntx parser
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" mapper - It is meant to work with the telescope plugin. It helps you search for currently active keymaps, get info about them, and jump to their definition if you want to change them.
Plug 'lazytanuki/nvim-mapper'
" telescope - a highly extendable fuzzy finder over lists
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Fugitive - git integration
Plug 'tpope/vim-fugitive'
" vim-virtualenv - allow vim use current virtualenv
Plug 'jmcantrell/vim-virtualenv'
" A more adventurous wildmenu
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" colorscheme pack
Plug 'flazz/vim-colorschemes'

Plug 'famiu/feline.nvim'

"" flake8 on F7
"Plug 'nvie/vim-flake8'
"" wakatime tracker (account deleted)
"Plug 'wakatime/vim-wakatime'
"" code snippets plugin
"Plug 'SirVer/ultisnips'
"" snippets library
"Plug 'honza/vim-snippets'
"" jedi-vim is a VIM binding to the autocompletion library Jedi.
"Plug 'davidhalter/jedi-vim'
"" Deoplete - Dark powered asynchronous completion framework for neovim/Vim8
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"" Deoplete source for jedi
"Plug 'deoplete-plugins/deoplete-jedi'
"" syntax checker for many languages
"Plug 'vim-syntastic/syntastic'
"" Semshi provides semantic highlighting for Python in Neovim.
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

require('feline').setup()

"" Syntastic setup
"let g:syntastic_python_pylint_post_args="--max-line-length=120"
"let g:syntastic_python_flake8_args='--ignore=E501,E225'

"" Semshi setup
"let g:semshi#update_delay_factor='0.0001'
"nmap <silent> <leader>ee :Semshi error<CR>
"nmap <silent> <leader>ge :Semshi goto error<CR>
"nmap <silent> <leader>rr :Semshi rename<CR>

"" jedi-vim setup
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_stubs_command = "<leader>s"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>u"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"

" nerdtree setup
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" airline setup
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Straight tabline separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"" Compe setup
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"" Wilder setup
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
call wilder#set_option('pipeline', [
          \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 0,
      \       'set_pcre2_pattern': has('nvim'),
      \     }),
      \   ),
      \ ])
let s:highlighters = [
            \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
          \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
          \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ 'reverse': 1,
      \ })))


"" Init LSP
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.dockerls.setup{}
EOF

" Init Telescope
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

" Init nvim-mapper
lua << EOF
require("nvim-mapper").setup({
  no_map = false,                                        -- do not assign the default keymap (<leader>MM)
  search_path = os.getenv("HOME") .. "/.config/nvim/lua" -- default config search path is ~/.config/nvim/lua
})
require('telescope').load_extension('mapper')
EOF



"" Options
syntax on
filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set hlsearch

set list
set listchars=tab:▸-,trail:·

let mapleader = ","

" Enable true color 启用终端24位色
if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
endif

colorscheme desert
let g:airline_theme='simple'

set pastetoggle=<F2>

""Open new split panes to right and bottom
set splitbelow
set splitright

""disable visual mode with mouse
set mouse-=a

""search for visually selected text with //
vnoremap // y/<C-R>"<CR>

""search and replace hilighted text with ^R
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"" set nohilight shortcut
map <leader>h :noh<CR>

"" Deoplete options
"let g:deoplete#enable_at_startup = 1

"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>




"" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

"" Force syntax highliting
autocmd BufNewFile,BufRead *.svelte set syntax=html
