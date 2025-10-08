return {
  {
    -- this plugin reaches out to lsps to get completion snippets
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    -- this plugin provides the snippets which nvim-cmp then displays
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets" -- this plugin gets vscode snippets
    }
  },
  {
    -- this is default completion plugin for nvim. this doesnt actually source the completions,
    -- it just provides the window functionality (i think). sourcing is done by other plugin
    "hrsh7th/nvim-cmp",
    config = function()
      -- Set up nvim-cmp. got this from the github
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- we are using luasnip 
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = "buffer" },
          }),
      })
    end,
  }
}
