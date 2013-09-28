#
# ~/.bashrc
#

export EDITOR=vim

export BXSHARE="/usr/local/share/bochs/"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Style ##
reset="\[\033[0m\]"
bright="\[\033[1m\]"
dim="\[\033[2m\]"
underscore="\[\033[4m\]"
blink="\[\033[5m\]"
reverse="\[\033[7m\]"
hidden="\[\033[8m\]"

## Colors ##
black="\[\033[30m\]"
red="\[\033[31m\]"
green="\[\033[32m\]"
orange="\[\033[33m\]"
blue="\[\033[34m\]"
maroon="\[\033[35m\]"
cyan="\[\033[36m\]"
grey="\[\033[37m\]"
white="\[\033[38m\]"

function git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

#${white}\u${reset}${bright}${black}@${reset}${white}\h${reset} \
export PS1="${reset}${cyan}\w${reset} 
\`r=\$?; b=\$(git_branch);\
if [ ! \"\$b\" = \"\" ];\
then printf \"${bright}${black}(${bright}${blue}\$b${reset}${bright}${black})${reset} \"; fi; \
if [ \$r = 0 ]; \
then printf \"${green}$\"; \
else printf \"${red}$\"; fi\`${reset} "

alias ll='ls -la'
alias sudo='sudo '
alias watch='watch '
alias grep='grep --color=auto '

function fooltmux () {
  TEMP_TERM=$TERM
  TEMP_TERM_SUFFIX=${TERM#$(echo $TERM | cut -f 1 -d'-')}
  TERM="xterm${TEMP_TERM_SUFFIX}"
}

function psgrep() {
  ps u | head -1
  grep_cmd="grep -i $1"
  ps aux | $grep_cmd | grep -v "$grep_cmd"
}

function psme() {
  psgrep $USER
}

if [ -f ~/.bashrc_extra ]; then
    source ~/.bashrc_extra
fi

