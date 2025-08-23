return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--fallback-style=llvm",
    "--header-insertion=never",
    "--completion-style=detailed",
  },
}
