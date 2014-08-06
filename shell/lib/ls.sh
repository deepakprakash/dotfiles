case $(OSTYPE) in
  darvin*)
    alias ls="ls -FhG" ;;
  *)
    alias ls="ls -Fh --color=auto" ;;
esac
