vim:
  managed_vimrc: true
  allow_localrc: false
  config:
    syntax: 'on'
    colors: desert

  settings:
    et:
    cin:
    ru:
    bs: indent,eol,start
    showcmd:
    showmatch:
    smartcase:
    incsearch:
    autowrite:
    hidden:
    mouse: a
    number:
    backspace: 2
    noerrorbells:
    novisualbell:
    background: dark
    ai:
    si:
    cindent:
    tabstop: 4
    softtabstop: 4
    shiftwidth: 8
    nowrap:
    swapsync: ''

  mappings:
    <C-u>: :tabp<enter>
    <C-i>: :tabn<enter>
    <C-J>: <C-W>j
    <C-K>: <C-W>k
    <C-H>: <C-W>h
    <C-L>: <C-W>l

  lets:
    &colorcolumn: join(range(121,121),",")

