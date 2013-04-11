#
# ~/.bashrc
#

export EDITOR=vim

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
imaroon="\[\033[35m\]"
cyan="\[\033[36m\]"
grey="\[\033[37m\]"
white="\[\033[38m\]"

function git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
export PS1="${cyan}\w${reset} 
${white}\u${reset}${black}@${reset}${white}\h${reset} \
\`b=\$(git_branch);\
if [ ! \"\$b\" = \"\" ];\
then echo \"${black}(${blue}\$b${black})${reset} \";fi\`\
\`if [ \$? = 0 ]; \
then echo ${green}$; \
else echo ${red}$; fi\`${reset} "

alias ll='ls -la'
alias sudo='sudo '

function fooltmux () {
  TEMP_TERM=$TERM
  TEMP_TERM_SUFFIX=${TERM#$(echo $TERM | cut -f 1 -d'-')}
  TERM="xterm${TEMP_TERM_SUFFIX}"
}

function psgrep() {
  ps u | head -1
  ps aux | grep "$1" | grep -v "grep"
}

function psme() {
  psgrep $USER
}

if [ -f ~/.bashrc_extra ]; then
    source ~/.bashrc_extra
fi

