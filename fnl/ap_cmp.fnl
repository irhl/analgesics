; hrsh7th/nvim-cmp
; L3MON4D3/LuaSnip

; hrsh7th/cmp-path
; hrsh7th/cmp-buffer
; hrsh7th/cmp-nvim-lua
; hrsh7th/cmp-nvim-lsp
; saadparwaiz1/cmp_luasnip
(fn cmp_ensemble []
  (let [luasnip (require :luasnip)
        cmp     (require :cmp)]
    (cmp.setup
      {:mapping (cmp.mapping.preset.insert
                  {:A (cmp.mapping.scroll_docs   4)
                   :Z (cmp.mapping.scroll_docs  -4)
                   :E (cmp.mapping
                        {:i (cmp.mapping.abort)
                         :c (cmp.mapping.close)})
                   :<tab> (cmp.mapping.confirm
                            {:behavior cmp.ConfirmBehavior.Replace
                             :select true})})

       :completion {:completopt "menu,menuone,noinsert"}
       :snippet    {:expand #(luasnip.lsp_expand $1.body)}

       :sources [{:name :nvim_lsp :keyword_length  1}
                 {:name :nvim_lua :keyword_length  2}
                 {:name :luasnip  :keyword_length  2}
                 {:name :buffer   :keyword_length  3}
                 {:name :path     :keyword_length  6}]

       :formatting {:fields [:menu :abbr :kind]
                     :format (fn [entry item]
                               (local menu-icon
                                      {:buffer   "Ω"
                                       :luasnip  "⋗"
                                       :nvim_lsp "λ"
                                       :path     "🖫"})
                               (set item.menu
                                    (. menu-icon entry.source.name))
                               item)}

       :window {:documentation {:border ["╭"
                                         "─"
                                         "╮"
                                         "│"
                                         "╯"
                                         "─"
                                         "╰"
                                         "│"]}
                :completion {:scrollbar false}}})))

(cmp_ensemble)
