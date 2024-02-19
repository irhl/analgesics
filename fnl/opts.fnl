(local user (os.getenv "USER"))
(print (string.format "hi, %s!" user))

(local opts
  {:lazyredraw    true
   :ttyfast       true
   :termguicolors true

   :ruler         false
   :showcmd       false
   :showmode      false
   :signcolumn    "yes:2"

   :expandtab     false
   :hlsearch      false
   :incsearch     true
   :ignorecase    true
   :smartcase     true
   :smartindent   true
   :scrolloff     8
   :sidescrolloff 8

   :mouse         ""
   :guicursor     "i:block"
   :cursorline    true

   :wrap          false
   :fillchars     "eob: "
   :fileencoding  "utf-8"
   :clipboard     :unnamedplus

   :backup        false
   :swapfile      false
   :undofile      true
   :undodir       (vim.fn.expand "~/.cache/nvim/undodir")})

(each [v1 v2 (pairs opts)]
  (tset vim.opt v1 v2))
