(local ts (require :nvim-treesitter.configs))

(ts.setup {
    :ensure_installed [
        "c"
        "cpp"
        "lua"
        "vim"
	"vimdoc"
    ]
    :ignore_install [
        "javascript"
        "typescript"
        "npm"
        "python"
    ]
    :sync_install false
    :auto_install false

    :highlight {
        :enable true
        :disable {}
        :additional_vim_regex_highlighting false
    }
})
