return {
    {
        -- used to download lsps
        "williamboman/mason.nvim",
        config=function()
            require("mason").setup()
        end
    },
    {
        -- bridges gap between nvim-lspconfig and mason, and gives us ensure installed
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = {"lua_ls", "ts_ls", "clangd"}
            })
        end
    },
    {
        -- manages lsps
        "neovim/nvim-lspconfig",
        config = function()
            -- this is needed for auto completion snippets to be received
            -- has to be added to every config
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- setup our different lsp
            vim.lsp.config('lua_ls', {
              capabilities=capabilities
            })
            vim.lsp.enable('lua_ls')

            -- javascript, typescript
            vim.lsp.config('ts_ls', {
              capabilities=capabilities
            })
            vim.lsp.enable('ts_ls')

            -- clang for c
            vim.lsp.config("clangd", {
              capabilities=capabilities
            })
            vim.lsp.enable("clangd")

            vim.lsp.config['ocamllsp'] = {
                capabilities=capabilities,
                cmd = { 'ocamllsp' },
                filetypes = {
                    'ocaml',
                    'ocaml.interface',
                    'ocaml.menhir',
                    'ocaml.ocamllex',
                    'dune',
                    'reason'
                },
                root_markers = {
                    { 'dune-project', 'dune-workspace' },
                    { "*.opam", "esy.json", "package.json" },
                    '.git'
                },
                settings = {},
            }
            vim.lsp.enable('ocamllsp')

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- Shift-K to get hover definiton
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- gd for going to definition
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {}) -- <leader>ca to see code actions
            vim.keymap.set('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true }) -- <leader>ce to see what is causing error
        end
    }
}
