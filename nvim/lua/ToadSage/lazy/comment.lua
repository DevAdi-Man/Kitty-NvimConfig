return {
    'numToStr/Comment.nvim',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
        -- Setup ts-context-commentstring first
        require('ts_context_commentstring').setup({
            enable_autocmd = false, -- Disable autocmd, we'll use it manually
        })
        
        require('Comment').setup({
            padding = true,
            sticky = true,
            toggler = {
                line = 'gcc',  -- Single line comment toggle
                block = 'gbc', -- Multi-line/block comment toggle
            },
            opleader = {
                line = 'gc',   -- Single line comment in visual mode
                block = 'gb',  -- Multi-line comment in visual mode
            },
            mappings = {
                basic = true,
                extra = true,
            },
            -- Use ts-context-commentstring for dynamic comments
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
    end,
}
