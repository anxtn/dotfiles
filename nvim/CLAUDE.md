# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Context

Personal Neovim config (targets Neovim 0.12+). This directory lives inside a larger dotfiles git repo rooted at `~/.config`, so `git` commands operate on the whole dotfiles tree; scope staging/commits to `nvim/`. Commit messages are short, lowercase, imperative (e.g. `add texlab lsp for latex`).

There is no build or test suite. The `test/` directory holds sample files per language (`test.c`, `test.ts`, `test.tex`, ...) for manually checking LSP, formatting, and treesitter behavior — open one in nvim to verify a change.

Useful checks:
- Load config headlessly and surface errors: `nvim --headless +qa`
- Health checks: `:checkhealth vim.lsp`, `:checkhealth vim.pack`
- A PostToolUse hook (`.claude/hooks/checkhealth.sh`) runs headless `:checkhealth` after every edit to a `.lua`/`.json` file and reports ERROR/WARNING lines not already in `.claude/checkhealth-baseline.txt`. Always read and act on that report; new issues caused by an edit must be fixed before moving on. Delete the baseline file to regenerate it after fixing environment issues.
- `:LspVerboseInfo` (defined in `lua/config/user_command.lua`) copies the active buffer's LSP client dump to the `+` register.

## Architecture

**Plugin management uses native `vim.pack`, not lazy.nvim.** `lua/core/pack.lua` declares every plugin in one `vim.pack.add({...})` call; `nvim-pack-lock.json` pins revisions. To add a plugin: append its URL to that list, create `lua/plugins/<name>.lua` with its setup, and `require` it from `lua/plugins/init.lua`. The `PackChanged` autocmd in `pack.lua` runs `MasonUpdate` / `TSUpdate` after install/update — it must stay registered before `vim.pack.add()`.

**Load order matters** (`init.lua`): options → colorscheme autocmd → globals (leader = Space) → diagnostics → keymaps → `core.pack` → `plugins` → `config.lsp` → user commands. Within `lua/plugins/init.lua`, catppuccin must load before lualine (lualine's `theme = "auto"` reads the active colorscheme), and mason before mason-lspconfig.

**LSP setup uses the Neovim 0.11+ native API:**
- Servers are installed and auto-enabled by `mason-lspconfig` (`ensure_installed` in `lua/plugins/mason_lspconfig.lua`); `nvim-lspconfig` supplies default configs.
- Per-server overrides go in top-level `lsp/<server>.lua` files returning a `vim.lsp.Config` table (picked up automatically by `vim.lsp.config`).
- `lua/config/lsp.lua` handles multiple servers attaching to one filetype via two maps: `format[ft]` picks which client owns `<leader>lf` formatting (e.g. biome for JS/TS/JSON/CSS), and `logic[ft]` picks which client owns `gd` and the `<leader>l{a,e,w,h}` quickfix-diagnostics bindings (e.g. vtsls for TS). Adding a language usually means updating `mason_lspconfig.lua` `ensure_installed`, both maps in `lsp.lua`, and the parser list in `lua/plugins/treesitter.lua`.

Completion is blink.cmp (v1.x) with lazydev as a source for Neovim Lua API types; `<Tab>` accepts, `<C-j>`/`<C-k>` navigate.

## Style

Lua uses 4-space indentation (matches `vim.opt` settings); `.clang-format` (LLVM, 4 spaces, 120 cols) applies to the C/C++ test files. `README.md` documents keybindings — keep it in sync when changing mappings (it is currently partly stale, e.g. it lists `SPACE g d` while the code maps `gd`).
