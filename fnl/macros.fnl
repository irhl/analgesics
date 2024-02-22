(local config (require :config))

; functions ?> wait for global call
(fn _G.plugin_ensemble []
  (let [url-full "https://github.com/"
        url-raw "https://raw.githubusercontent.com/"
        dir (.. (vim.fn.stdpath :config) :/pack/plugins/start)
        dir_kana (.. dir :/kana)]
    (vim.fn.mkdir dir :p)
    (vim.fn.mkdir dir_kana :p)

    (local reply {})
    (each [_ repo (ipairs receive_full)]
      (local a (repo:match ".*/(.*)"))
      (local b (.. dir "/" a))
      (when (= (vim.fn.isdirectory b) 0)
        (table.insert reply (.. "git clone " url-full repo ".git " b))))

    (each [_ repo (ipairs receive_raw)]
      (local a (repo:match ".*/(.*)"))
      (local b (.. dir_kana "/" a))
      (when (= (vim.fn.filereadable b) 0)
        (table.insert reply (.. "curl -o " b " " url-raw repo))))
    (os.execute (table.concat reply " && ")))

  (io.write "\027[31m" "loading plugins.." "\027[0m")
  (io.flush))

(fn _G.kana []
  (vim.cmd (.. "set keymap=" (or (and vim.g.kana "") :kana)))
  (set vim.g.kana (not vim.g.kana)))

; functions ?> execute at runtime
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

(c1)
(c2)
(c3)
