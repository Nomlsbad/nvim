# AGENTS.md

Neovim config (lazy.nvim), developed against Neovim 0.12. Requires a recent nightly/stable for `vim.lsp.config` (0.11+) and `Snacks` APIs.

## Layout and entrypoints

- `init.lua` -> `lua/config/{options,lazy,mappings}.lua`
- `lua/plugins/` is auto-imported by lazy.nvim via `{ import = "plugins" }` (`lua/config/lazy.lua:29`).
  A new plugin is just a new file in `lua/plugins/` (or `lua/plugins/<dir>/init.lua`).
- `ftplugin/` files set per-filetype indentation: go = 4-space tabs (no expandtab), cpp = 4-space expandtab, lua/json/yaml = 2-space expandtab.
  Global `expandtab` is off; don't move these settings into `options.lua`.
- `README.md` is a personal TODO checklist, not documentation of behavior.
- `lazy-lock.json` is gitignored — never commit lockfile updates.

## LSP: native `vim.lsp.config`, no lspconfig `setup()` calls

- Per-server config lives in `after/lsp/<server>.lua` (`gopls.lua`, `clangd.lua`, `lua_ls.lua`).
  These files are NOT ftplugin files and are never `require`d - they are auto-discovered by
  `vim.lsp.config(name)`'s runtime lookup of `lsp/<name>.lua` (`after/` on the runtimepath).
  They must `return` a table (server config); top-level side effects (autocmds) run when the config is resolved.
  Filenames must match the lspconfig server name exactly.
- Shared defaults for all servers are in `lua/plugins/lsp/init.lua` via `vim.lsp.config("*")`;
  it side-effect-requires `plugins.lsp.mappings` and `plugins.lsp.diagnostic` and returns the lspconfig spec for lazy.
- `lua/plugins/lsp/mappings.lua` overrides `vim.lsp.buf.hover = require("pretty_hover").hover`.

## Gotchas

- `lua/config/mappings.lua:25-43` uses the bare global `Snacks` (`Snacks.toggle.*`).
  It evaluates during startup, so `lua/plugins/snaks/init.lua` must keep snacks.nvim non-lazy,
  removing/renaming it breaks startup.
- Suppressing snacks modules happens in `lua/plugins/snaks/init.lua` (e.g. `terminal.enabled = false`).
  Files like the deleted `snaks/scroll.lua` / `snaks/ident.lua` were replaced by dedicated plugins
  (`neoscroll`, `indent-blankline`); prefer adding specs there over reviving snacks features.
- Servers are NOT auto-started. The only `vim.lsp.enable()` call is in `.nvim.lua` for `lua_ls`;
  `gopls`/`clangd` start via `:LspStart` (no args = enable all servers matching the buffer filetype),
  `:LspRestart`, `:LspStop` — these come from lspconfig's plugin file, not from this config.
- This repo itself gets project-local editor config via `.nvim.lua` (loaded because `exrc` is on):
  it appends `.nvim` to the runtimepath and enables `lua_ls` when editing config files.
  `.nvim/lsp/lua_ls.lua` supplies the workspace libraries (lazy plugins, Vim runtime) and
  takes precedence over `after/lsp/lua_ls.lua` (later rtp entries win in the `vim.lsp.config` merge).
  Load it for new Lua files here if it doesn't attach automatically.

## Verifying changes

- Full config smoke test: `nvim --headless -u init.lua +qa` — any Lua error prints to stderr.
  The first run may auto-install missing plugins (`checker.enabled` in `lua/config/lazy.lua`);
  plugins live in `~/.local/share/nvim/lazy`.
- Use stylua for Lua formatting: `stylua .` honors `.stylua.toml` (2 spaces, width 100, double quotes).
  Conform also formats Lua buffers with stylua on save.

## Spell words

- `spell/en.utf-8.add` holds custom spell words; the compiled `spell/en.utf-8.add.spl` is checked in. After editing the `.add` file, recompile:
  `nvim -es -c 'mkspell! spell/en.utf-8.add.spl spell/en.utf-8.add' -c qa`
