(local tl (require :telescope.builtin))
(local keymaps
  {:silent [[[:v :n] :w      :0]
            [[:v :n] :ee     "$"]
            [[:v :n] :es     ":mark o <cr>"]
            [[:v :n] :er     "'o"]

            [:n      :tt     ":ToggleDiag<cr>"]
            [:n      :ff      tl.find_files {}]
            [:n      :fg      tl.live_grep  {}]
            [:n      :fb      tl.buffers    {}]
            [:n      :fv      tl.help_tags  {}]]

  :normal [[[:v :n]  :<C-f>  ":%s/"]
            [:n      :<C-i>  ":lua kana()<cr>"]
            [:n      :<C-z>  vim.cmd.bprev]
            [:n      :<C-a>  vim.cmd.bnext]
            [:n      :<C-c>  vim.cmd.exit]
            [:n      :<C-s>  vim.cmd.write]]})

(local opts
  {:lazyredraw       true
   :ttyfast          true
   :termguicolors    true

   :ruler            false
   :showcmd          false
   :showmode         false
   :signcolumn       "yes:2"

   :expandtab        false
   :hlsearch         false
   :incsearch        true
   :ignorecase       true
   :smartcase        true
   :smartindent      true
   :scrolloff        8
   :sidescrolloff    8

   :mouse            ""
   :guicursor        "i:block"
   :cursorline       true

   :wrap             false
   :fillchars        "eob: "
   :fileencoding     "utf-8"
   :clipboard        :unnamedplus

   :backup           false
   :swapfile         false
   :undofile         true
   :undodir          (vim.fn.expand "~/.cache/nvim/undodir")})

{:opts opts
 :keymaps keymaps}
