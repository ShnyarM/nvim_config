return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config=function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed={"lua", "javascript", "c", "ocaml"},
            auto_install = true, -- automatically installs the parser of languages we open for which we dont have any
            highlight = {enable = true},
            indent = { enable = true},
        })
    end
}
