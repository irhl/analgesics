; williamboman/mason.nvim
; williamboman/mason-lspconfig.nvim
; hrsh7th/cmp-nvim-lsp
(local servers
 [:lua_ls
  :fennel_language_server])

((. (require :mason) :setup))
((. (require :mason-lspconfig) :setup) {:ensure_installed servers})

(local lspconfig (require :lspconfig))
(local lsp_capabilities
    ((. (require :cmp_nvim_lsp) :default_capabilities)))

; ignore false error of unused identifier: client
(fn on_attach [client bufnr]
  (fn buf_set_keymap [...] (vim.api.nvim_buf_set_keymap bufnr ...))

  (local opts {:noremap true :silent true})
    (buf_set_keymap :n :A "<cmd> lua vim.lsp.buf.hover()       <cr>" opts)
    (buf_set_keymap :n :R "<cmd> lua vim.lsp.buf.rename()      <cr>" opts)
    (buf_set_keymap :n :C "<cmd> lua vim.lsp.buf.code_action() <cr>" opts)
    (buf_set_keymap :n :D "<cmd> lua vim.lsp.buf.references()  <cr>" opts))

(fn lsp_ensemble []
  (each [_ lsp (ipairs servers)]
    ((. lspconfig lsp :setup)
     {:settings
        {:Lua {:diagnostics
	         {:globals ["vim"]
                  :disable [:lowercase-global
		            :trailing-space]}
      :telemetry {:enable false}}}
      :flags {:debounce_text_changes 150}
      :capabilities lsp_capabilities
      :on_attach on_attach})))

(lsp_ensemble)
