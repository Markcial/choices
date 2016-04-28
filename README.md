[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# Choices

Versatile helper for a multiline choice selector with  prompt and high configurability.

## Install

With [fisherman]

```
fisher choices
```

## Usage

```fish
$ choices -h

Usage: choices [--prompt=<s>] [--default=<s>] [--explicit] [--error=<s>] [--help] CHOICES<a>

    -p --prompt     Set the prompt text
    -e --error      Set the error message
    -x --explicit   Uses explicit selection, not by index
    -d --default    Default value for selection
    -h --help       Show usage help
```
## Options

`-p` or `--prompt` The message prompted to the user requesting the input. String, Defaults to `Select one : `

`-e` or `--error` The message displayed to the user when the selection is not valid. String, Defaults to `Invalid selection. Must be one of %(choices)!`

`-x` or `--explicit` Switches between selection by index or explicitly by one of the literal choices sent, by default the selection is done by indexes. Boolean, defaults to 0.

`-d` or `--default` The default value if the user just presses enter without any value. String, defaults to none.

`-h` or `--help` Displays the usage for the function.

## Examples

A installation setup with multiple choices.

```fish
choices --prompt="Which library do you want to install? Default All" --default=6 --explicit 1 "Node" "Ruby" "Python" "Groovy" "Clojure" "All the above"
```

```
1) Node
2) Ruby
3) Python
4) Groovy
5) Clojure
6) All the above
Which library do you want to install? Default All # press enter without value
=> 6
```

A delicate configuration that needs explicit input

```fish
choices --prompt="Which profile want to completely erase? " --error="Value can only be one from %(choices)" --explicit 1 "Mike" "Dave" "Bruce"
```

```
Mike
Dave
Bruce
Which profile want to completely erase? Wade
Value can only be one from Mike Dave Bruce
```

[travis-link]: https://travis-ci.org/fisherman/choices
[travis-badge]: https://img.shields.io/travis/fisherman/choices.svg
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
