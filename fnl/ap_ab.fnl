(comment
	"LOOK AT THIS, ITS STONE COLD STEVE AUSTIN!!
	STONE COLD STUNNER!!!!!! STUNNNERRR!
	OM MAH GAWWWWWWDD!!!!!!!")

; disable builtin plugins & providers
(local builtin_plugins
  [:2html_plugin
   :getscript
   :getscriptPlugin
   :gzip
   :logipat
   :netrw
   :netrwPlugin
   :netrwSettings
   :netrwFileHandlers
   :matchit
   :tar
   :tarPlugin
   :rrhelper
   :spellfile_plugin
   :vimball
   :vimballPlugin
   :zip
   :zipPlugin
   :tutor
   :rplugin
   :syntax
   :synmenu
   :optwin
   :compiler
   :bugreport
   :ftplugin])

(local builtin_providers
  [:node :perl :ruby])

(each [_ plugin (pairs builtin_plugins)]
  (tset vim.g (.. :loaded_ plugin) 1))

(each [_ provider (ipairs builtin_providers)]
  (tset vim.g (.. :loaded_ provider :_provider) 0))
