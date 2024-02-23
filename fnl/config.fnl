(comment "castle gates of irhl

do the command below, to start downloading plugins
:lua plugin_ensemble()

everything should be good now. good gracious.. ravioli moli..
  holi moli.... tf is in the pocket holi?

[!]")

(local tl (require :telescope.builtin))
(local keymaps
  {:silent
    ; cursor movement
    [[[:v :n]  :w      :0]
     [[:v :n]  :ee     "$"]
     ; cursor travel
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
    ; find and replace
    [[[:v :n]  :<C-f>  ":%s/"]

     [[:v :n]  :<C-i>  ":lua kana()<cr>"]
     [[:v :n]  :<C-t>  ":ToggleDiag<cr>"]
         [:n   :<C-z>  vim.cmd.bprev]
         [:n   :<C-a>  vim.cmd.bnext]
         [:n   :<C-c>  vim.cmd.exit]
         [:n   :<C-s>  vim.cmd.write]]})

(local autocmd
    ; trim trailing whitespaces
  [[:BufWritePre  "*" "%s/\\s\\+$//e"]])

(local options
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

(local receive_full
   ; EDITOR STANDARD
  [:nvim-treesitter/nvim-treesitter
   :nvim-telescope/telescope.nvim
   :nvim-lua/plenary.nvim
   :folke/which-key.nvim
   :echasnovski/mini.starter

   ; EDITOR ENLIGHTENMENT
   :williamboman/mason.nvim
   :williamboman/mason-lspconfig
   :neovim/nvim-lspconfig
   :hrsh7th/nvim-cmp
   :hrsh7th/cmp-path
   :hrsh7th/cmp-buffer
   :hrsh7th/cmp-nvim-lua
   :hrsh7th/cmp-nvim-lsp
   :saadparwaiz1/cmp_luasnip
   :L3MON4D3/LuaSnip

   ; EDITOR ENCHANCEMENT
   :windwp/nvim-autopairs
   :mg979/vim-visual-multi

   ; SYNTAX HIGHLIGHTING
   :lewis6991/gitsigns.nvim
   :brenoprata10/nvim-highlight-colors
   :lukas-reineke/indent-blankline.nvim])

(local receive_raw
   ; MULTILINGUAL INPUT PLUGINS
   [:neovim/neovim/master/runtime/keymap/kana.vim
    :skk-dev/dict/master/SKK-JISYO.L])

{:autocmd           autocmd
 :options           options
 :keymaps           keymaps
 :receive_raw       receive_raw
 :receive_full      receive_full}
