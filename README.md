<div align="center">

# 🔢 Choices

**Configurable multiline choice selector with a prompt, for the [fish shell](https://fishshell.com).**

[![License: MIT](https://img.shields.io/github/license/Markcial/choices)](LICENSE)
![fish shell](https://img.shields.io/badge/fish-shell-4AAE46)
[![tests](https://github.com/Markcial/choices/actions/workflows/test.yml/badge.svg)](https://github.com/Markcial/choices/actions/workflows/test.yml)
[![GitHub stars](https://img.shields.io/github/stars/Markcial/choices?style=social)](https://github.com/Markcial/choices/stargazers)

</div>

## ✨ Features

- 🔢 **Select by index** (default) or ✍️ **by literal value** (`--literal 1`)
- 💬 **Custom prompt** and **custom error message**, with `%(choices)` interpolation
- ⏎ **Default value** when the user just presses Enter
- 🔁 Re-prompts until the answer is valid, then prints it to stdout

## 📦 Install

With [Fisher] 4 on fish 3 or newer. `choices` depends on [getopts](https://github.com/jorgebucaran/getopts.fish), so install both plugins:

```fish
fisher install jorgebucaran/getopts.fish markcial/choices
```

## 🚀 Usage

### ✍️ Literal selection

```fish
choices --prompt="Which profile should I erase? " \
        --error="The only profiles I know are: %(choices)" \
        --literal 1 "Mike" "Dave" "Bruce"
```

```text
Mike
Dave
Bruce
Which profile should I erase? Wade
Mike
Dave
Bruce
The only profiles I know are: Mike Dave Bruce
Which profile should I erase? Dave
Dave
```

### 🔢 Selection by item index

```fish
choices --prompt="Which library do you want to install? Default: All" \
        --default=6 \
        "Node" "Ruby" "Python" "Groovy" "Clojure" "All of the above"
```

`--default` is prefilled on the prompt line. Press Enter to accept it. The function prints the accepted value:

```text
1) Node
2) Ruby
3) Python
4) Groovy
5) Clojure
6) All of the above
Which library do you want to install? Default: All6
6
```

## ⚙️ Options

| Flag | Description | Default |
|---|---|---|
| `-p`, `--prompt` | The message prompted to the user requesting the input. | `"Select one : "` |
| `-e`, `--error` | The message displayed when the selection is not valid. `%(choices)` is replaced with the options. | `"Invalid selection. Must be one of %(choices)!"` |
| `-l`, `--literal` | Select by one of the literal choices instead of by index. | `0` (by index) |
| `-d`, `--default` | Value used if the user just presses Enter. | none |
| `-h`, `--help` | Show usage information. | |

## 🧪 Tests

Tests are written with [fishtape](https://github.com/jorgebucaran/fishtape) in `test/choices.fish`.

```fish
fisher install jorgebucaran/getopts.fish jorgebucaran/fishtape $PWD
fishtape test/choices.fish
```

## 📄 License

[MIT](LICENSE)

[Fisher]: https://github.com/jorgebucaran/fisher

---

<div align="center">

Made by **Marc Garcia** · [marcgarcia.dev](https://marcgarcia.dev) · [@_marc_garcia on X](https://x.com/_marc_garcia) · [GitHub](https://github.com/Markcial)

</div>
