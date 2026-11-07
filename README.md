# My Neovim Config

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

- Leader: `<Space>`, localleader: `\`
- Colorscheme: [tokyonight](https://github.com/folke/tokyonight.nvim) (night)
- Developed against Neovim 0.12; requires 0.11+ (`vim.lsp.config`, `Snacks` APIs)
- Plugins are auto-installed on first start; update via `:Lazy`
- Requires a Nerd Font, fzf, tree-sitter cli

## Layout

```
init.lua                    -> requires config.{options,lazy,mappings}
lua/config/
  options.lua               global vim.opt settings
  mappings.lua              global keymaps (windows, tabs, toggles)
  lazy.lua                  lazy.nvim bootstrap + spec import
  icons.lua                 shared nerd-font glyph tables (aerial, mini-icons, neo-tree, diagnostics)
lua/plugins/                one file per plugin, auto-imported by lazy.nvim
  lsp/                      nvim-lspconfig spec + shared LSP config (mappings, diagnostics)
  snacks/                   snacks.nvim (terminal disabled)
after/lsp/                  vim.lsp.config() per-server configs (gopls, clangd, lua_ls)
ftplugin/                   per-filetype indentation
.nvim.lua                   project-local editor config (exrc), enables lua_ls
.nvim/lsp/lua_ls.lua        lua_ls workspace libraries for this repo
```

## Keymaps (`lua/config/mappings.lua` + plugins)

| Keys | Action |
| --- | --- |
| `<C-arrow>` | resize window |
| `<leader><tab>...` | tabs: `<tab>` new, `]`/`[` next/prev, `f` first, `l` last, `o` only, `d` close |
| `<leader>ui` / `ul` / `us` / `un` / `uN` / `uh` | toggle indent / list / spell / line number / relative number / inlay hints |
| `<leader>cF` | toggle auto-format |
| `<esc>` | clear search highlight (i/n/s) |
| `gO` | document symbols via aerial |
| `gd` / `gD` / `gY` / `gi` / `gr` | LSP: definition / declaration / type def / implementation / references |
| `gh` / `gH` | LSP: type hierarchy super-/subtypes |
| `K` / `<C-k>` / `D` | LSP: hover / signature help / diagnostics float |
| `<space>ca` / `<space>cr` | LSP: code action / rename |
| `<space>wa` / `wr` / `wl` | LSP: add / remove / list workspace folders |
| `<leader>e` | neo-tree float (reveal) |
| `<leader>bd` | delete buffer (mini.bufremove) |
| `<S-tab>` / `<tab>` / `[B` / `]B` | bufferline: cycle / move buffers |
| `<leader>f`... / `<leader>s`... | fzf-lua: files, buffers, oldfiles, grep, diagnostics, ... (see `:WhichKey`) |
| `<leader>?` | which-key buffer-local keymaps |
| `<leader>cf` | conform format (n/v) |
| `<leader>qs` / `qS` / `ql` / `qd` | persistence: load / select / load last / stop saving |
| `]h` / `[h` / `]H` / `[H` | gitsigns: hunk navigation |
| `<leader>hs` / `hr` / `hp` / `hb` / `hd` | gitsigns: stage / reset / preview / blame / diff hunk |
| `<leader>tb` / `<leader>tw` | toggle line blame / word diff |
| `ih` | gitsigns hunk textobject (o/x) |

## LSP

Native `vim.lsp.config()` — no lspconfig `setup()` calls. Servers are **not** auto-started (except `lua_ls` in this repo):

- `after/lsp/<server>.lua` holds per-server config; filenames must match the lspconfig server name. Settings:
- Shared defaults in `lua/plugins/lsp/init.lua`: `vim.lsp.config("*")` (file operations capabilities), LSP keymaps and diagnostic config
- Hover is replaced by `pretty_hover`; diagnostics float with rounded border (`severity_sort`)

## Project-local config

`exrc` loads `.nvim.lua` per project; it appends `.nvim` to the runtimepath and calls
`vim.lsp.enable("lua_ls")` — the only `vim.lsp.enable()` in the config. `.nvim/lsp/lua_ls.lua`
provides workspace libraries (lazy plugins, Vim runtime) and wins over `after/lsp/lua_ls.lua`
(later runtimepath entries win in the `vim.lsp.config` merge).

---

# TODO

## View
- [x] Mapping to toggle 'list' option.
- [x] Mapping to toggle 'spell' option.

## Indent
- [x] Display tabs as 4 spaces by default.
- [x] Turn on expandtab for cpp, lua, json and yaml files.
- [x] Display tabs as 2 spaces lua, yaml and json.
- [x] Set listchars for tabs and spaces.
- [ ] Toggle between inline and list. See snacks.toggle line_number impl.

## Highlight
- [ ] Change markdown highlights (manually or change theme).

## Blink
- [ ] Add completions for keywords.
- [ ] Add descriptions for mappings for which key.
- [ ] Try to improve completions mappings in command mode.

## Bufferline
- [ ] Show that buffer has uncommited changes.
- [ ] Do not mix buffers when one was opened or closed.

## Fzf Lua
- [x] Ignore .cache and build dirs
- [x] Do not hide files from .gitignore
- [ ] Ignore .cache and build dirs (for local project?)

## Lualine
- [ ] Remove diff from lualine.
- [ ] Remove filetype.

## Neo-tree
- [ ] Try decrease opening of file system tree delay.
- [ ] How to quit from preview???

## Pretty hover
- [ ] Try to apply render-markdown for hover.
- [ ] Move mapping to pretty-hover.lua file.
- [ ] Set width limitation (local for project at least).

## Render markdown
- [x] Disable render-markdown by default.

## treesitter
- [ ] Do something with treesitter version.

## Which key
- [x] Fix tips scrolling.
