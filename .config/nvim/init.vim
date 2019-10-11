" mikey

if !has("compatible") " prevent vi from parsing .vimrc
    filetype off " vundle req
    set rtp+=~/.config/nvim/bundle/Vundle.vim " vundle req

    call vundle#begin()
      Plugin 'gmarik/Vundle.vim'

    " Window/Tab/Buffer
      Plugin 'spolu/dwm.vim' " tiling (c-c, c-n, c-space, c-hjkl, c-w + shift-hjkl)
      Plugin 'bufexplorer.zip' " \be buffer browser
      Plugin 'kopischke/vim-stay' " remember buffer position

    " Code Formating/Parsing/Ctags
      Plugin 'scrooloose/nerdcommenter' " \ci \cc etc.

      Plugin 'vim-airline/vim-airline'

      Plugin 'airblade/vim-gitgutter'

      Plugin 'scrooloose/nerdtree'

      Plugin 'vim-airline/vim-airline-themes'

    " VCS
      Plugin 'tpope/vim-fugitive' " git

      Plugin 'uguu-org/vim-matrix-screensaver'

    " Syntax
      Plugin 'leafgarland/typescript-vim'

    " Util
      Plugin 'rking/ag.vim' " ag vim wrapper
      Plugin 'tpope/vim-surround' " cs\"' - surround text

    " Visual/Highlighting
      Plugin 'Mark' " highlight vars with \m - awesome
      Plugin 'mhinz/vim-startify' " start screen
      Plugin 'Yggdroot/indentLine' " dotted indent visual
      Plugin 'ntpeters/vim-airline-colornum' " color cursorline
      Plugin 'bronson/vim-trailing-whitespace' " hl trail ws, :FixWhitespace

    " Themes
      Plugin 'zeis/vim-kolor'
      Plugin 'jonathanfilip/vim-lucius'
      Plugin 'morhetz/gruvbox'
    call vundle#end()

  " Mappings
    nmap ; :| " without shift
    map `` ^| " first word of line  (rather than shift-6)
    map <c-q> $ ge| " last word of line
    map <F2> :spl<cr>:term<cr>| " new buffer terminal
    map <F3> :setlocal paste!<cr>|
    map <F5> :IndentLinesToggle<cr>|
    map <F6> :set cursorline!<cr>|
    map <c-v><space> :noh<cr>| " clear search
    map <leader>. :AgFromSearch<cr>| " ag * equivalent

  " Misc
    set fileformat=unix " overwritten somewhere? placed in tabs.
    set autoread " auto detect external write
    set expandtab " ws char = tab char
    set tabstop=2 " ? (confirm)
    set shiftwidth=2 " << >> /indent ws amount
    set softtabstop=2 " ? (confirm)
    set list
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:•
    set smartcase " / search case insensitive
    set foldmethod=manual " no auto fold
    set nofoldenable " disable folding
    filetype plugin indent on " user indent/* files if available

  " Visual
    syntax on " highlighting
    set t_Co=256 " colors
    colorscheme lucius| :LuciusDark
    set number " show line number
    set hlsearch " hl search
    set showcmd " show command value rhs
    set laststatus=2 " always show status
    autocmd bufenter * highlight Search cterm=NONE cterm=NONE cterm=underline
    let g:startify_bookmarks = ['~/.vimrc', '/var/www/']

  " Tab Character Highlighting
    function! Tabs()
      syntax match Tab /\t/
      hi Tab cterm=underline ctermbg=blue ctermfg=red
      set fileformat=unix
    endfunction
    au BufEnter,BufRead * call Tabs()
endif " !has("compatible") " prevent vi from parsing .vimrc
