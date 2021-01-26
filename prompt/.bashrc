# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

set_title (){
  case "$TERM" in
    xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
    *)
      ;;
  esac
}

show_usage () {
  echo "Usage:  prompt [basic|custom|kali|backtrack]"
}

prompt () {
  prompt_type=${1:-h} 
  case "$prompt_type" in
    basic)
      basic_prompt
      ;;
    custom)
      custom_prompt
      ;;
    kali)
      kali_prompt
      ;;
    backtrack)
      backtrack_prompt
      ;;
    h|-h|help|-help|--help)
      show_usage
      ;;
    *)
      echo -e "${RED}Unknown prompt!${NC}"
      show_usage
      ;;
  esac
  set_title
}

kali_prompt () {
  prompt_color='\[\033[;32m\]'
  info_color='\[\033[1;34m\]'
  prompt_symbol=㉿

  if [ "$EUID" -eq 0 ]; then
    prompt_color='\[\033[;94m\]'
    info_color='\[\033[1;31m\]'
    prompt_symbol=���
  fi

  PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
}

backtrack_prompt () {
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
}

basic_prompt () {
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
}

custom_prompt () {
  PS1="\$(__last_status) ${BGREEN}\u@\h${NC}:${BBLUE}\w${CYAN}\$(__git_ps1)${NC} $ "
}

prompt kali
