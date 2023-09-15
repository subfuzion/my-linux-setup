#/usr/bin/env bash
#complete -W $(tmux ls -F '#{session_name}' | tr '\n' ' ') ta

_tmux_sessions() {
  # Use echo to force newlines-to-spaces conversion.
  echo $(tmux ls -F '#{session_name}')
}

_tmux_completions() {
  COMPREPLY=($(compgen -W "$(_tmux_sessions)" "${COMP_WORDS[1]}"))
}

complete -F _tmux_completions ta
