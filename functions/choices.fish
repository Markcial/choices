function choices -d "Choices function"
  set -l prompt "Select one : "
  set -l error "Invalid selection. Must be one of %(choices)!"
  set -l literal 0
  set -l default
  set -l choices

  getopts $argv | while read -l 1 2
    switch "$1"
      case l literal
        set literal $2
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
        printf "    -l --literal    Uses explicit selection, not by index\n"
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

  set -l invalid 0

  if test $literal -eq 1
    set rule (echo -s \|$choices | cut -b 2-)
  else
    set rule (echo -s \|(seq 1 (count $choices)) | cut -b 2-)
  end

  function -S __error_msg
    echo $error | sed "s:%(choices):$choices:"
  end

  function -S __prompt
    set -l counter 1
    for choice in $choices
      set -l out
      if test $literal -eq 0
        set out "$out$counter) "
        set counter (math $counter + 1)
      end
      set out "$out$choice"
      echo $out
    end
    if test $invalid -eq 1
      __error_msg
    end
    echo $prompt
  end

  while test -z "$result"
    read -c $default -p __prompt -l given

    if echo $given | grep -qE "^($rule)\$"
        set result $given
    else
        set invalid 1
    end
  end
  functions -e __error_msg
  functions -e __prompt
  echo $result
end
