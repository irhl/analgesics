; windwp/nvim-autopairs
(local autopairs (require :nvim-autopairs))
(autopairs.setup)

; nvim-telescope/telescope.nvim
(local telescope (require :telescope))
(telescope.setup {:pickers {:find_files {:hidden true}}})

(set vim.opt.timeout true)
(set vim.opt.timeoutlen 300)

; folke/which-key.nvim
(local which_key (require :which-key))
(which_key.setup {:icons {:group      "+"
                          :breadcrumb "="
                          :separator  "->"}})

; lewis6991/gitsigns.nvim
(local gitsigns (require :gitsigns))
(gitsigns.setup {:signs {:add          {:text "++"}
                         :change       {:text "::"}
                         :delete       {:text "--"}
                         :changedelete {:text "~~"}
                         :topdelete    {:text "xx"}
                         :untracked    {:text ".."}}

                         :signcolumn true
                         :numhl false
                         :linehl false
                         :word_diff false
                         :watch_gitdir {:follow_files false}})

; brenoprata10/nvim-highlight-colors
(local highlight_colors (require :nvim-highlight-colors))
(highlight_colors.setup {:render "foreground"
                          :enable_named_colors false
                          :enable_tailwind false})

; lukas-reineke/indent-blankline.nvim.git
(local indent_blankline (require :indent_blankline))
(indent_blankline.setup {:show_end_of_line true})

(set vim.g.indent_blankline_bufname_exclude
  ["abc.cht"
  ".*\\.txt"])

; WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
(local lsp-diagnostics (require "toggle_lsp_diagnostics"))
(lsp-diagnostics.init)

; kana.vim, written by Rory McCann
(set vim.g.eskk_directory
  {:path "~/.config/nvim/pack/plugins/start/kana"})

(set vim.g.eskk_dictionary
  {:path "~/.config/nvim/pack/plugins/start/kana/SKK-JISYO.L"
   :sorted 1
   :encoding "utf-8"})

(set vim.g.eskk_large_dictionary
  {:path "~/.config/nvim/pack/plugins/start/kana/SKK-JISYO.L"
   :sorted 1
   :encoding "euc-jp"})

(set vim.g.eskk_kakutei_when_unique_candidate 1)
(set vim.g.eskk_enable_completion 0)
(set vim.g.eskk_no_default_mappings 1)
(set vim.g.eskk_keep_state 0)
(set vim.g.eskk_egg_like_newline 1)
