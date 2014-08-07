d() {
  if [[ -n "$1" ]]; then
    cd "+$1"
  else
    dirs -v
  fi
}
