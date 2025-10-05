return {
    {
        "williamboman/mason.nvim",
        config=function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = {"lua_ls", "ts_ls"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('lua_ls', {})
            vim.lsp.enable('lua_ls')

            vim.lsp.config('ts_ls', {})
            vim.lsp.enable('ts_ls')

            vim.lsp.config['ocamllsp'] = {
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

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
        end
    }
}
