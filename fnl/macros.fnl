(comment
  "STONE COLD STUNNER! STUNNER TO YOUR MOM!")

(local config (require :config))

(fn _G.kana []
  (vim.cmd (.. "set keymap=" (or (and vim.g.kana "") :kana)))
  (set vim.g.kana (not vim.g.kana)))

(fn sh []
  (each [_ section (pairs [config.keymaps.silent config.keymaps.normal])]
    (each [_ v (ipairs section)]
      (local opts (or (and (= section config.keymaps.silent)
                          {:noremap true :silent true}) nil))
      (vim.keymap.set (. v 1) (. v 2) (. v 3) opts))))

(fn it []
  (each [v1 v2 (pairs config.opts)]
    (tset vim.opt v1 v2)))

(sh)(it)
