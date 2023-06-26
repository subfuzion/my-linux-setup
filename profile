parse_git_branch() {
  git branch --show-current 2>/dev/null | sed -e 's/\(.*\)/ (\1)/'
}

prompt_generator() {
        export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)\n\$ "
}

export PROMPT_COMMAND=prompt_generator
