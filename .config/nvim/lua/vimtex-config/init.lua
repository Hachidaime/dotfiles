vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex' }

vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {
    '-xelatex', '-shell-escape', '-verbose', '-file-line-error', '-synctex=1',
    '-interaction=nonstopmode'
  }
}

vim.g.vimtex_view_method = 'zathura'
