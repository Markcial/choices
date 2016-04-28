function choices -d "Choices function"
  set -l prompt "Select one : "
  set -l error "Invalid selection. Must be one of %(choices)!"
  set -l explicit 0
  set -l default
  set -l choices

  getopts $argv | while read -l 1 2
    switch "$1"
      case x explicit
        set explicit $2
      case d default
        set default $2
      case p prompt
        set prompt $2
      case e error
        set error $2
      case h help
        printf "Usage: choices [--prompt=<s>] [--default=<s>] [--explicit] [--error=<s>] [--help] CHOICES<a> \n\n"
        printf "    -p --prompt     Set the prompt text\n"
        printf "    -e --error      Set the error message\n"
        printf "    -x --explicit   Uses explicit selection, not by index\n"
        printf "    -d --default    Default value for selection\n"
        printf "    -h --help       Show usage help\n"
        return
      case _
        set choices $choices $2
      case \*
        printf $2
        printf "choices: '%s' is not a valid option\n" $1 > /dev/stderr
        choices --h > /dev/stderr
        return 1
    end
  end
  if test -z "$choices"
    choices --h > /dev/stderr
    return 1
  end
  set -l counter 1
  for choice in $choices
    if test $explicit -eq 0
      echo -n "$counter) "
      set counter (math $counter + 1)
    end
    echo $choice
  end
  if test $explicit -eq 1
    set rule (echo -s \|$choices | cut -b 2-)
  else
    set rule (echo -s \|(seq 1 (count $choices)) | cut -b 2-)
  end
  get --prompt=$prompt --error=(echo $error | sed "s:%(choices):$choices:") --rule="^($rule)\$" --default=$default
end
