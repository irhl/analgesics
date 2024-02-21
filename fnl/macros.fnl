(local config (require :config))

(fn _G.kana []
  (vim.cmd (.. "set keymap=" (or (and vim.g.kana "") :kana)))
  (set vim.g.kana (not vim.g.kana)))

(fn c1 []
  (each [_ section (pairs [config.keymaps.silent config.keymaps.normal])]
    (each [_ v (ipairs section)]
      (local opts (or (and (= section config.keymaps.silent)
                          {:noremap true :silent true}) nil))
      (vim.keymap.set (. v 1) (. v 2) (. v 3) opts))))

(fn c2 []
(each [_ v (ipairs config.autocmd)]
  (vim.cmd (string.format "autocmd %s %s %s" (. v 1) (. v 2) (. v 3)))))

(fn c3 []
  (each [v1 v2 (pairs config.options)]
    (tset vim.opt v1 v2)))

(fn c4 []
  (each [_ plugin (pairs config.builtin_plugins)]
    (tset vim.g (.. :loaded_ plugin) 1)))

(fn c5 []
  (each [_ provider (ipairs config.builtin_providers)]
    (tset vim.g (.. :loaded_ provider :_provider) 0)))

(c1)
(c2)
(c3)
(c4)
(c5)
