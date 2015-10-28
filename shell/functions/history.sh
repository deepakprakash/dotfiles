# Smart/integrated history list and search
function h() {
  if [ $# -eq 0 ];then
    # No arguments passed. Simple history list.
    fc -l 1
  else
    # Grep history with the first argument
    fc -l 1 | grep "$1"
  fi
}
