return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {},
		})
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		-- Define LSP capabilities with cmp_nvim_lsp capabilities
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Setup fidget (LSP progress)
		require("fidget").setup({})
		-- Setup mason (LSP manager)
		require("mason").setup()
		-- Setup mason-lspconfig (LSP integration with mason)
		require("mason-lspconfig").setup({
			--- add ensure lsp for default installation
			ensure_installed = {
				"lua_ls",
				"marksman",
				-- "clangd",
				"ts_ls",
				-- "rust_analyzer",
				-- "zls",
			},
			handlers = {
				function(server_name) -- Default handler for LSPs
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Zig LSP setup
				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
				-- clangd
				["clangd"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.clangd.setup({})
				end,
				-- typescript
				["ts_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.ts_ls.setup({})
				end,
				-- rust_analyzer
				["rust_analyzer"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.rust_analyzer.setup({})
				end,
				-- Lua LSP setup
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		-- Setup completion
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For luasnip users
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users
			}, {
				{ name = "buffer" },
			}),
		})

		-- Configure diagnostics appearance
		vim.diagnostic.config({
			-- Uncomment to enable diagnostic updates in insert mode
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
