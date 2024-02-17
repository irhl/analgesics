(local user (os.getenv "USER"))
(print (string.format "hi, %s!" user))

(local opts
  {:ruler         false
   :wrap          false
   :showcmd       false
   :showmode      false
   :swapfile      false
   :undofile      true
   :backup        false
   :termguicolors true

   :mouse ""
   :guicursor "i:block"
   :signcolumn "yes:2"
   :fillchars "eob: "
   :fileencoding :utf-8
   :clipboard :unnamedplus
   :completeopt {:menu :menuone :noselect true}
   :undodir (vim.fn.expand "~/.cache/nvim/undodir")})

(each [v1 v2 (pairs opts)]
  (tset vim.opt v1 v2))
