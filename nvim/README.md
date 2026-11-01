# Neovim Config

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
