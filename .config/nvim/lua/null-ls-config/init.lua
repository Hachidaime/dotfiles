local lspconfig = require("lspconfig")
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

-- require 'lspconfig'["null-ls"].setup({
null_ls.setup({
  sources = {
    formatting.prettierd.with({
      filetypes = {
        "javascript", "javascriptreact", "typescript", "typescriptreact", "vue",
        "css", "scss", "less", "html", "json", "jsonc", "yaml", "graphql",
        "handlebars", "svelte", "markdown"
      }
    }), formatting.black, formatting.shfmt, formatting.clang_format,
    formatting.cmake_format, formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator',
        '--column-limit=80', '--break-after-table-lb', '--indent-width=2'
      }
    }), formatting.isort,
    -- formatting.codespell.with({ filetypes = { 'markdown' } }),
    formatting.latexindent
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ asycn = true })
        end
      })
    end
  end
})
