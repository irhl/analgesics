; echasnovski/mini-starter
(local H {})

(fn H.default_header []
  (let [hour (tonumber (vim.fn.strftime "%H"))
        part-id (+ (math.floor (/ (+ hour 4) 8)) 1)
        day-part (. [:evening :morning :afternoon :evening] part-id)
        username (or (. (vim.loop.os_get_passwd) :username) :USERNAME)]
    (: "good %s, %s!" :format day-part username)))

; output distortion when written directly
; this is just fennel behavior
; we'll do the safe method i guess
(fn ascii_art [filename]
  (local file (io.open filename "r"))
  (when (not file)
    (error (.. "x " filename)))
  (local reply (file:read "*a"))
  (file:close)
  reply)
(set H.default_footer (ascii_art (.. (os.getenv "HOME") "/.config/nvim/fnl/ap_starter.txt")))

(local starter (require :mini.starter))
(starter.setup
  {:header H.default_header
   :footer H.default_footer
   :evaluate_single true
   :items [(starter.sections.recent_files 5 false false)

            {:action ":!bb firefox voidlinux.org/packages"
             :name "XBPS Packages"
             :section :Bookmarks}

            {:action "!bb steam"
             :name "Steam Client"
             :section :Bookmarks}]

   :content_hooks
     [(starter.gen_hook.adding_bullet)
      (starter.gen_hook.aligning :center :center)]})
