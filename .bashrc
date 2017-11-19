if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

#Цвета из http://bashrcgenerator.com/
#export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

#Определение кода возврата
PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\];)\"; else echo \"\[\033[01;31m\];(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "



# Для начала определить некоторые цвета:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

#Опечатки
alias mroe='more'
alias pdw='pwd'
alias sl='ls --color'
#_____________

alias ll='ls -l'
alias dir='ls -ba'
alias c='clear'
alias ls='ls --color'


alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ll="ls -la"
alias tun1vds="ssh -D 6000 sam@62.109.21.250 -p 8022 -f -N"
alias upd="sudo pacman -Syu"
alias killcs="pkill hl2.exe && pkill wine"

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

function ii()   # Дополнительные сведения о системе
{
    echo -e "\n${CYAN}Вы находитесь на ${RED}" ; hostname 
    echo -e "\nДополнительная информация:$NC ${RED}" ; uname -a
    echo -e "\n${CYAN}В системе работают пользователи:$NC ${RED}" ; w -h
    echo -e "\n${CYAN}Дата:$NC ${RED}" ; date
    echo -e "\n${CYAN}uptime :$NC ${RED}" ; uptime
    echo -e "\n${CYAN}Память :$NC ${RED}" ; free
    echo -e "\n${CYAN}IP адрес:$NC ${RED}" ; ifconfig | grep inet
    echo -e "" ; df -H
}

function test()
{
	echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
}


export EDITOR=/usr/bin/nano
export VISUAL=$EDITOR
