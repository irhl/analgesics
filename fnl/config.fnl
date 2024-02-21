(comment "LOOK AT THIS, ITS STONE COLD STEVE AUSTIN!!
	 STONE COLD STUNNER!!!!!! STUNNNERRR!
	 OM MAH GAWWWWWWDD!!!!!!!")

(local tl (require :telescope.builtin))
(local keymaps
  {:silent 
    [[[:v :n]  :w      :0]
     [[:v :n]  :ee     "$"]
     [[:v :n]  :es     ":mark o <cr>"]
     [[:v :n]  :er     "'o"]
         [:n   :ff     tl.find_files {}]
         [:n   :fg     tl.live_grep {}]
         [:n   :fb     tl.buffers {}]
         [:n   :fv     tl.help_tags {}]
         [:n   :<C-h>  ":resize +10<cr>"]
         [:n   :<C-j>  ":resize -10<cr>"]
         [:n   :<C-k>  ":vertical resize +10<cr>"]
         [:n   :<C-l>  ":vertical resize -10<cr>"]]

   :normal 
    [[[:v :n]  :<C-f>  ":%s/"]
         [:n   :<C-i>  ":lua kana()<cr>"]
         [:n   :<C-t>  ":ToggleDiag<cr>"]
         [:n   :<C-z>  vim.cmd.bprev]
         [:n   :<C-a>  vim.cmd.bnext]
         [:n   :<C-c>  vim.cmd.exit]
         [:n   :<C-s>  vim.cmd.write]]})
  
(local opts
  {:lazyredraw       true
   :ttyfast          true
   :termguicolors    true

   :mouse            ""
   :guicursor        "i:block"
   :cursorline       true
   :scrolloff        8 
   :sidescrolloff    8 

   :wrap             false
   :expandtab        false
   :hlsearch         false
   :incsearch        true
   :ignorecase       true
   :smartcase        true
   :smartindent      true

   :ruler            false
   :showcmd          false
   :showmode         false
   :signcolumn       "yes:2"
   :fileencoding     :utf-8
   :clipboard        :unnamedplus
   :completeopt      {:menuone :noselect}
   :fillchars        {:eob  " " :fold " " :vert " "}

   :backup           false
   :swapfile         false
   :undofile         true
   :undodir          (vim.fn.expand "~/.cache/nvim/undodir")})

; disable builtin plugins
(local builtin_plugins 
  [:2html_plugin :getscript :getscriptPlugin :gzip :logipat
   :netrw :netrwPlugin :netrwSettings :netrwFileHandlers
   :matchit :tar :tarPlugin :rrhelper :spellfile_plugin
   :vimball :vimballPlugin :zip :zipPlugin :tutor :rplugin
   :syntax :synmenu :optwin :compiler :bugreport :ftplugin])

(local builtin_providers
  [:node :perl :ruby])

{:opts              opts
 :keymaps           keymaps
 :builtin_plugins   builtin_plugins
 :builtin_providers builtin_providers}
