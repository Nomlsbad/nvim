return {
  settings = {
    clangd = {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--experimental-modules-support",
        "--fallback-style=llvm",
        "--header-insertion=never",
        "--completion-style=detailed",
      },
    },
  },
}
