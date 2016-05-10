[![Build status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# Choices

Configurable multiline choice selector with a prompt.

## Install

With [fisherman]

```
fisher choices
```

## Usage

```fish
choices --prompt="Which profile should I erase? " \
        --error="The only profiles I know are: %(choices)" \
        --literal 1 "Mike" "Dave" "Bruce"
```

```
Mike
Dave
Bruce
Which profile should I erase? Wade
The only profiles I know are: Mike Dave Bruce
```

Selection by item index.

```fish
choices --prompt="Which library do you want to install? Default: All" \
        --default=6 \
        "Node" "Ruby" "Python" "Groovy" "Clojure" "All of the above"
```

```
1) Node
2) Ruby
3) Python
4) Groovy
5) Clojure
6) All of the above
Which library do you want to install? Default: All # Press Enter
=> 6
```



## Options

-p, --prompt: The message prompted to the user requesting the input. String. *Default*: "Select one : "

-e, --error: The message displayed to the user when the selection is not valid. String. *Default*: "Invalid selection. Must be one of %(choices)!"

-l --literal: Switches between selection by index or explicitly by one of the literal choices sent, by default the selection is done by it's index. Boolean defaults to 0

-d, --default: The default value if the user just presses enter without any value. String. *Default*: None.

-h, --help: Show usage information.

[travis-link]: https://travis-ci.org/fisherman/choices
[travis-badge]: https://img.shields.io/travis/fisherman/choices.svg
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
