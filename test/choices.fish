test "$TEST It can display help, long flag"
  (choices --help) = "Usage: choices [--prompt=<s>] [--default=<s>] [--explicit] [--error=<s>] [--help] CHOICES<a> " \
  "" \
  "    -p --prompt     Set the prompt text" \
  "    -e --error      Set the error message" \
  "    -l --literal    Uses explicit selection, not by index" \
  "    -d --default    Default value for selection" \
  "    -h --help       Show usage help"
end

test "$TEST It can display help, short flag"
  (choices -h) = "Usage: choices [--prompt=<s>] [--default=<s>] [--explicit] [--error=<s>] [--help] CHOICES<a> " \
  "" \
  "    -p --prompt     Set the prompt text" \
  "    -e --error      Set the error message" \
  "    -l --literal    Uses explicit selection, not by index" \
  "    -d --default    Default value for selection" \
  "    -h --help       Show usage help"
end

#test "$TEST It can display single choices"
#  (mock read; set -g result 1; choices a) = "1) a" \
#    "--prompt=Select one :  --error=Invalid selection. Must be one of a! --rule=^(1)\$"
#end

#test "$TEST It can display two choices"
#  (mock get 0 "echo \$args"; choices a b) = "1) a" \
#   "2) b" \
#    "--prompt=Select one :  --error=Invalid selection. Must be one of a b! --rule=^(1|2)\$"
#end

#test "$TEST It can display multiple choices"
#  (mock get 0 "echo \$args"; choices a b c d e f) = "1) a" \
#   "2) b" "3) c" "4) d" "5) e" "6) f" \
#    "--prompt=Select one :  --error=Invalid selection. Must be one of a b c d e f! --rule=^(1|2|3|4|5|6)\$"
#end

#test "$TEST The prompt parameter can be setted long flag"
#  (mock get 0 "echo \$args"; choices --prompt="meh" foo) = "1) foo" "--prompt=meh --error=Invalid selection. Must be one of foo! --rule=^(1)\$"
#end

#test "$TEST The prompt parameter can be setted short flag"
#  (mock get 0 "echo \$args"; choices --p meh foo) = "1) foo" "--prompt=meh --error=Invalid selection. Must be one of foo! --rule=^(1)\$"
#end

#test "$TEST The error parameter can be setted long flag"
#  (mock get 0 "echo \$args"; choices --p a --error="boh" foo) = "1) foo" "--prompt=a --error=boh --rule=^(1)\$"
#end

#test "$TEST The error parameter can be setted short flag"
#  (mock get 0 "echo \$args"; choices --p a -e boh foo) = "1) foo" "--prompt=a --error=boh --rule=^(1)\$"
#end

#test "$TEST The literal flag selection changes rules and output"
#  (mock get 0 "echo \$args"; choices --p a -e b --literal 1 foo) = "foo" "--prompt=a --error=b --rule=^(foo)\$"
#end

#test "$TEST The literal short flag selection changes rules and output"
#  (mock get 0 "echo \$args"; choices --p a -e b -l 1 foo) = "foo" "--prompt=a --error=b --rule=^(foo)\$"
#end

#test "$TEST The literal flag selection changes rules and output even for multiple"
#  (mock get 0 "echo \$args"; choices --p a -e b --literal 1 foo bar spam eggs) = "foo" "bar" "spam" "eggs" "--prompt=a --error=b --rule=^(foo|bar|spam|eggs)\$"
#end

#test "$TEST The default flag is forwarded to get"
#  (mock get 0 "echo \$args"; choices --p a -e b --default default foo) = "1) foo" "--prompt=a --error=b --rule=^(1)\$ --default=default"
#end

#test "$TEST The default short flag is forwarded to get"
#  (mock get 0 "echo \$args"; choices --p a -e b -d default foo) = "1) foo" "--prompt=a --error=b --rule=^(1)\$ --default=default"
#end
