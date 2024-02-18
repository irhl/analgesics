(local bind vim.api.nvim_set_keymap)
(local opts {:noremap true :silent true})

(set vim.g.mapleader    " ")
(set vim.g.localleader  ",")

(let [list
  [; cursor movement
   [ :n "w"         "0"]
   [ :n "ee"        "$"]

   ;cursor travel
   [ :n "es"        ":mark o <cr>"]
   [ :n "er"        "'o"]

   [ "" :<c-f>      ":%s/"]
   [ "" :<c-s>      "<esc>:w<cr>"]
   [ "" :<c-c>      "<esc>:q!<cr>"]
   [ :n :<leader>ff "<cmd>Telescope find_files<cr>" ]
   [ :n :<leader>fg "<cmd>Telescope live_grep<cr>"  ]
   [ :n :<leader>fb "<cmd>Telescope buffers<cr>"    ]
   [ :n :<leader>fn "<cmd>Telescope help_tags<cr>"  ]]]

(each [_ o (ipairs list)]
  (let [(mode v1 v2) (unpack o)]
    (bind mode v1 v2 opts))))
