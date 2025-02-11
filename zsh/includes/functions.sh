# Reference:
#   - https://qr.ae/TWGGiA
#   - https://github.com/shitikanth/dotfiles/blob/a0261a4b64e2b27da095b8f26bf0567a8b19587f/_bashrc.functions

# Extract many files with one command
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar Jxvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

function up () {
  LIMIT=$1
  P=$PWD/..
  for ((i=1; i < LIMIT; i++))
  do
    P=$P/..
  done
  cd $P
}

function cl () {
  cd "$@" && la;
}

man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;36m") \
    LESS_TERMCAP_md=$(printf "\e[1;36m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;33m") \
    man "$@"
}

function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

function count() {
  total=$1
  for ((i=total; i>0; i--)); do sleep 1; printf "Time remaining $i secs \r"; done
  echo -e "\a"
}

weather(){ curl -s "wttr.in/$1?m1"}
