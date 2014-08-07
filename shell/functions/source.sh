# Based on http://stackoverflow.com/questions/10735574/include-source-script-if-it-exists-in-bash
source_if_exists ()  {
  if [ -f $1 ]; then
    source $1
  fi
}
