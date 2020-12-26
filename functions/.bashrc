weather () {
  curl -s "wttr.in/$1?u1n"
}

up () {
  times=${1:-1}
  while [ $times -gt 0 ]; do
    cd ..
    times=$(( $times - 1 ))
  done
}

trump () {
  curl -s https://api.whatdoestrumpthink.com/api/v1/quotes/random | jq '.message'
}

__git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

__last_status () {
  [[ $? -eq 0 ]] && echo -e $GREEN_CHECK || echo -e $RED_X
}

append_path () {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

prepend_path () {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

