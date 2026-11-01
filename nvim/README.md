# Neovim Config

Personal Neovim config for **Neovim 0.12+**. Plugins are managed with the native
`vim.pack` (no lazy.nvim), LSP servers are installed by Mason and configured via
the native `vim.lsp` API.

## Requirements 📦

### Required

| Tool                          | Used by                                                  |
|:------------------------------|:---------------------------------------------------------|
| Neovim ≥ 0.12                 | everything (`vim.pack`, `vim.lsp.config`)                |
| `git`                         | `vim.pack` (plugin install/update)                       |
| `curl`, `tar`, `gzip`, `unzip`| Mason, nvim-treesitter, blink.cmp (prebuilt binary)      |
| C compiler (`gcc`)            | nvim-treesitter (compiles parsers)                       |
| `tree-sitter` CLI ≥ 0.26.1    | nvim-treesitter (`main` branch, **not** the npm package) |
| `ripgrep`                     | Telescope live grep (`SPACE f t`)                        |
| `fd`                          | Telescope find files (faster, optional — falls back to `rg`) |
| Node.js + `npm`               | Mason: `pyright`, `vtsls`, `biome`, `cssls`, `html`, `jsonls` |
| `wl-clipboard`                | `+` register on Wayland (`:LspVerboseInfo`)              |
| A [Nerd Font](https://www.nerdfonts.com/) | icons (devicons, lualine, diagnostics, Mason)  |

### LaTeX (VimTeX + texlab)

| Tool                                | Used by                                   |
|:------------------------------------|:------------------------------------------|
| TeX Live (LaTeX, AMS, beamer, babel-german, hyperref) | compiling documents     |
| `latexmk`                           | VimTeX compiler                           |
| `zathura` + PDF plugin (MuPDF/Poppler) | VimTeX viewer (`zathura_simple`)       |

### Optional (per language)

Only needed if you work in that language — the LSP server itself is installed by Mason.

| Tool              | Language / LSP          |
|:------------------|:------------------------|
| `rust` + `cargo`  | Rust / `rust_analyzer`  |
| `zig`             | Zig / `zls`             |
| .NET SDK          | C# / `omnisharp`        |
| `python3`         | Python / `pyright`      |

### Install commands

**Fedora (dnf)**

```sh
# required
sudo dnf install neovim git curl tar gzip unzip gcc tree-sitter-cli ripgrep fd-find nodejs npm wl-clipboard

# LaTeX
sudo dnf install texlive-scheme-medium texlive-collection-langgerman latexmk zathura zathura-pdf-mupdf

# optional languages
sudo dnf install rust cargo zig dotnet-sdk-10.0 python3
```

**Debian / Ubuntu (apt)**

```sh
# required
sudo apt install git curl tar gzip unzip build-essential ripgrep fd-find nodejs npm wl-clipboard

# LaTeX
sudo apt install texlive-latex-base texlive-latex-recommended texlive-latex-extra \
    texlive-fonts-recommended texlive-lang-german latexmk zathura

# optional languages
sudo apt install rustc cargo dotnet-sdk-8.0 python3
```

> [!NOTE]
> The `neovim` and `tree-sitter-cli` packages in Debian/Ubuntu stable are usually too old.
> Install Neovim from the [official releases](https://github.com/neovim/neovim/releases)
> and the tree-sitter CLI from its [releases](https://github.com/tree-sitter/tree-sitter/releases)
> or via `cargo install --locked tree-sitter-cli`. Zig is not packaged in Debian stable —
> download it from [ziglang.org](https://ziglang.org/download/).
> On Debian/Ubuntu the `fd` binary is called `fdfind` (Telescope finds it automatically).

**Arch Linux (pacman)**

```sh
# required
sudo pacman -S neovim git curl tar gzip unzip base-devel tree-sitter-cli ripgrep fd nodejs npm wl-clipboard ttf-jetbrains-mono-nerd

# LaTeX (latexmk is part of texlive-binextra)
sudo pacman -S texlive-basic texlive-latex texlive-latexrecommended texlive-latexextra \
    texlive-fontsrecommended texlive-langgerman texlive-binextra zathura zathura-pdf-mupdf

# optional languages
sudo pacman -S rust zig dotnet-sdk python
```

On Fedora and Debian/Ubuntu install a Nerd Font manually from
[nerdfonts.com](https://www.nerdfonts.com/font-downloads) (e.g. JetBrainsMono Nerd Font)
and set it in your terminal.

## Installation 🚀

```sh
git clone <this repo> ~/.config   # config lives in ~/.config/nvim
nvim
```

On first start `vim.pack` asks to install all plugins (revisions pinned in
`nvim-pack-lock.json`). Afterwards Mason installs the LSP servers and
nvim-treesitter compiles the parsers in the background. Check the result with:

```vim
:checkhealth vim.pack
:checkhealth vim.lsp
:checkhealth vimtex
```

## Plugins 🧩

| Plugin                                   | Purpose                              |
|:-----------------------------------------|:-------------------------------------|
| catppuccin (mocha)                       | colorscheme                          |
| lualine.nvim                             | statusline                           |
| alpha-nvim                               | start screen                         |
| nvim-web-devicons                        | file icons                           |
| nvim-autopairs                           | auto-close brackets/quotes           |
| nvim-treesitter                          | parsers                              |
| blink.cmp + friendly-snippets            | completion & snippets                |
| lazydev.nvim                             | Neovim Lua API completion            |
| mason.nvim + mason-lspconfig + nvim-lspconfig | LSP install & config            |
| telescope.nvim + plenary.nvim            | fuzzy finder                         |
| vimtex                                   | LaTeX compile / view / motions       |

### LSP servers

`lua_ls`, `clangd`, `cssls`, `pyright`, `vtsls`, `rust_analyzer`, `lemminx`, `zls`,
`jsonls`, `biome`, `html`, `omnisharp`, `texlab`

If several servers attach to one filetype, `lua/config/lsp.lua` decides which one
handles formatting (e.g. `biome` for JS/TS/JSON/CSS) and which one handles
go-to-definition and the diagnostic lists (e.g. `vtsls` for JS/TS).

## Keybindings ⌨️

Leader is `SPACE`, local leader (VimTeX) is `\`.

### LSP 💡

Normal mode

| Action                          | Key             |
|:--------------------------------|:----------------|
| Goto definition                 | `g` `d`         |
| Rename symbol                   | `g` `r` `n`     |
| Execute code action             | `g` `r` `a`     |
| List symbol references          | `g` `r` `r`     |
| List implementations            | `g` `r` `i`     |
| Goto type definition            | `g` `r` `t`     |
| List all symbols in buffer      | `g` `O`         |
| Symbol info at cursor           | `K`             |
| Format current buffer           | `SPACE` `l` `f` |
| All diagnostics → quickfix      | `SPACE` `l` `a` |
| Errors → quickfix               | `SPACE` `l` `e` |
| Warnings → quickfix             | `SPACE` `l` `w` |
| Hints → quickfix                | `SPACE` `l` `h` |
| Diagnostic info at cursor       | `CTRL` `w` `d`  |
| Next / previous diagnostic      | `]` `d` / `[` `d` |

Insert mode

| Action           | Key        |
|:-----------------|:-----------|
| Signature help   | `CTRL` `s` |

### Search 🔍

Normal mode

| Action           | Key             |
|:-----------------|:----------------|
| Search for files | `SPACE` `f` `f` |
| Search for text  | `SPACE` `f` `t` |

### Completion ❯❯❯❯

Insert mode

| Action                     | Key                     |
|:---------------------------|:------------------------|
| Open completion            | `CTRL` `SPACE`          |
| Next / previous item       | `CTRL` `j` / `CTRL` `k` |
| Accept                     | `TAB`                   |
| Close menu                 | `CTRL` `e`              |
| Scroll documentation       | `CTRL` `b` / `CTRL` `f` |

### LaTeX (VimTeX) 📄

Normal mode, in `.tex` files

| Action                           | Key             |
|:---------------------------------|:----------------|
| Start / stop continuous compile  | `\` `l` `l`     |
| Forward search (open in zathura) | `\` `l` `v`     |
| Stop compiler                    | `\` `l` `k`     |
| Show errors (quickfix)           | `\` `l` `e`     |
| Table of contents                | `\` `l` `t`     |
| Clean auxiliary files            | `\` `l` `c`     |

Backward search: `CTRL` + click in zathura jumps to the line in Neovim.

### Commands

| Command           | Action                                              |
|:------------------|:----------------------------------------------------|
| `:LspVerboseInfo` | copy the LSP client dump of the buffer to `+` register |

## Testing 🧪

`test/` contains sample files per language (`test/c/test.c`, `test/latex/test.tex`, …)
to manually check LSP, formatting, treesitter and VimTeX after changes.
