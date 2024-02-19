(let [luasnip (require :luasnip)
      cmp     (require :cmp)]
  (cmp.setup
    {:snippet    {:expand #(luasnip.lsp_expand $1.body)}
     :completion {:completopt "menu,menuone,noinsert"}

     :mapping (cmp.mapping.preset.insert
                {:<C-f> (cmp.mapping.scroll_docs  4)
                 :<C-d> (cmp.mapping.scroll_docs -4)
                 :<c-e> (cmp.mapping
                          {:i (cmp.mapping.abort)
                           :c (cmp.mapping.close)})
                 :<tab> (cmp.mapping.confirm
                          {:behavior cmp.ConfirmBehavior.Replace
                           :select true})})

     :sources [{:name :nvim_lsp :keyword_length 1}
               {:name :nvim_lua :keyword_length 2}
               {:name :luasnip  :keyword_length 2}
               {:name :buffer   :keyword_length 3}
               {:name :path     :keyword_length 6}]

              :window {:documentation {:border ["╭"
                                                "─"
                                                "╮"
                                                "│"
                                                "╯"
                                                "─"
                                                "╰"
                                                "│"]}
                       :completion {:scrollbar false}}}))
