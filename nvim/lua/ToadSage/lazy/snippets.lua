return {
    {
        "L3MON4D3/LuaSnip",
        -- Follow the latest release.
        version = "v2.*", -- Ensure you are on the latest v2 release
        -- Install jsregexp (optional but recommended for regex support).
        build = "make install_jsregexp",

        dependencies = { "rafamadriz/friendly-snippets" }, -- Install friendly snippets for various languages

        config = function()
            local ls = require("luasnip")
            
            -- Load friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Extend filetype configuration for JavaScript to include jsdoc snippets
            ls.filetype_extend("javascript", { "jsdoc" })
            
            -- Extend JavaScript filetype to include React Native snippets
            ls.filetype_extend("javascript", { "react-native" })
            ls.filetype_extend("javascriptreact", { "react-native" })
            ls.filetype_extend("typescript", { "react-native-ts" })
            ls.filetype_extend("typescriptreact", { "react-native-ts" })

            -- Key mapping to expand snippets (trigger snippet expansion)
            vim.keymap.set({ "i" }, "<C-s>e", function()
                ls.expand()
            end, { silent = true })

            -- Key mappings to jump between snippet placeholders
            vim.keymap.set({ "i", "s" }, "<C-s>;", function()
                ls.jump(1)
            end, { silent = true }) -- Jump forward
            vim.keymap.set({ "i", "s" }, "<C-s>,", function()
                ls.jump(-1)
            end, { silent = true }) -- Jump backward

            -- Key mapping to change choice in a choice node if active
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
}
