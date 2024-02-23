(comment "castle gates of irhl

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

; BULBAASUR EGG.. STRAIGHT FROM THE TREE????
(local bgNormal    :#201f1e)   (local fgNormal    :#716b67)
(local Visual      :#2a2928)   (local String      :#8a827d)
(local LineNR      :#2d2c2a)   (local Statement   :#9f948d)
(local PreProc     :#403e3c)   (local Operator    :#a98b90)
(local Special     :#544e4c)   (local Float       :#c89699)
(local Identifier  :#7e6f6f)   (local Function    :#bf838c)

(local theme
  {:Normal               {:fg fgNormal   :bg bgNormal}
   :String               {:fg String     :bg :NONE}

   :Constant             {:fg fgNormal   :bg :NONE}
   :Function             {:fg Function   :bg :NONE}
   :Identifier           {:fg Identifier :bg :NONE}
   :Type                 {:fg fgNormal   :bg :NONE}
   :PreProc              {:fg PreProc    :bg :NONE}
   :Statement            {:fg Statement  :bg :NONE}
   :SpecialKey           {:fg fgNormal   :bg :NONE}
   :Special              {:fg Special    :bg :NONE}
   :Repeat               {:fg fgNormal   :bg :NONE}
   :Operator             {:fg Operator   :bg :NONE}
   :Float                {:fg Float      :bg :NONE}
   :Number               {:fg Float      :bg :NONE}
   :NonText              {:fg fgNormal   :bg :NONE}
   :TODO                 {:fg fgNormal   :bg :NONE}
   :Title                {:fg Statement  :bg :NONE}
   :Underlined           {:fg fgNormal   :bg :NONE}

   :Comment              {:fg PreProc  :bg :NONE}
   :LineNR               {:fg LineNR   :bg :NONE}
   :SignColumn           {:fg bgNormal :bg bgNormal}
   :Search               {:fg bgNormal :bg fgNormal}

   :Search               {:fg bgNormal :bg fgNormal}
   :IncSearch            {:fg bgNormal :bg fgNormal}
   :Substitute           {:fg bgNormal :bg fgNormal}
   :MatchParen           {:fg bgNormal :bg fgNormal}
   :Visual               {:fg :NONE    :bg Visual}
   :DiffAdd              {:fg fgNormal :bg :NONE}
   :DiffText             {:fg fgNormal :bg :NONE}
   :DiffChange           {:fg fgNormal :bg :NONE}
   :DiffDelete           {:fg fgNormal :bg :NONE}
   :Directory            {:fg fgNormal :bg :NONE}
   :Folded               {:fg :NONE    :bg Visual}

   :Error                {:fg fgNormal :bg :NONE}
   :ErrorMsg             {:fg fgNormal :bg :NONE}
   :WarningMsg           {:fg fgNormal :bg :NONE}
   :MoreMsg              {:fg fgNormal :bg :NONE}
   :Question             {:fg fgNormal :bg :NONE}

   :DiagnosticError      {:fg fgNormal :bg :NONE}
   :DiagnosticWarn       {:fg fgNormal :bg :NONE}
   :Pmenu                {:fg fgNormal :bg bgNormal}
   :PmenuKind            {:fg fgNormal :bg String}
   :PmenuExtra           {:fg fgNormal :bg String}
   :PmenuSel             {:fg fgNormal :bg Visual}
   :PmenuThumb           {:fg fgNormal :bg bgNormal}
   :Statusline           {:fg fgNormal :bg bgNormal}
   :StatuslineNC         {:fg bgNormal :bg bgNormal}
   :TabLine              {:fg fgNormal :bg bgNormal}
   :CursorLine           {:fg :NONE    :bg Visual}

   :WhichKeyFloat                     {:link :Statusline}
   :IndentBlanklineChar               {:link :LineNr}
   :IndentBlanklineSpaceChar          {:link :LineNr}
   :IndentBlanklineSpaceCharBlankline {:link :LineNr}
   :IndentBlanklineContextStart       {:link :LineNr}
   :IndentBlanklineContextChar        {:link :Constant}})

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
   :L3MON4D3/LuaSnip
   :saadparwaiz1/cmp_luasnip

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
 :theme             theme
 :receive_raw       receive_raw
 :receive_full      receive_full}
