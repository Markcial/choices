function choices -d "Choices function"
  set -l prompt "Select one : "
  set -l error "Invalid choice!"
  set -l choices

  getopts $argv | while read -l 1 2
    switch "$1"
      case p prompt
        set prompt $2
      case e error
        set error $2
      case h help
        printf "Usage: choices [--prompt=<s>] [--error=<s>] [--help] CHOICES<a>\n\n"
        printf "    -p --prompt     Set the prompt text\n"
        printf "    -e --error      Set the error message\n"
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
  for choice in $choices
    echo $choice
  end
  set rule (echo -s \|$choices | cut -b 2-)
  get --prompt=$prompt  --error=$error --rule="^($rule)\$"
end
