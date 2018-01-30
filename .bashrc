# Will's BASH configurations
# 
# -------------------------------------------------------------------
# SECTIONS
#
# 1. Environment Configuration
# 2. Terminal Commands
# 3. File and Folder Management
# 4. Searching
# 5. Process Management
# 6. Networking
# 7. System Operations and Information
# 8. Web Dev
# -------------------------------------------------------------------


# -------------------------------------------------------------------
# 1. Environment Configuration
# -------------------------------------------------------------------

# Change Prompt
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Git
#source ~/.git-prompt.sh  # see repository status in shell (e.g. on master branch)
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias git_branch_sort_latest='git branch --sort=committerdate'  # sorts ASC, use -committerdate for DESC

# Add to Paths
export PATH="$PATH:/usr/bin/"
export PATH="$PATH:/usr/local/bin/"

# Golang Paths
export PATH="$PATH:$HOME/go/bin"
export GOPATH=$(go env GOPATH)
export GOBIN="$PATH:$HOME/go/bin"

# MySQL
export MYSQL_PS1="(\u@\h) [\d]> "

# Editor Config
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR="$VISUAL"

# History - for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# Colors
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
force_color_prompt=yes
LS_COLORS=$LS_COLORS:'di=0;92:' ;
export LS_COLORS


# Virtualenv wrapper
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
source /usr/local/bin/virtualenvwrapper.sh

# -------------------------------------------------------------------
# 2. Terminal Commands
# -------------------------------------------------------------------

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Change to my default programs
alias ipython="ipython3"
alias open="gnome-open"
alias pip="pip3"
alias python="python3"
alias vim="nvim"

# Make terminal commands better
alias c='clear'                             # clear terminal display
alias cp='cp -iv'                           # cp with interactive and verbose flags
alias mkdir='mkdir -pv'                     # make directories as needed
alias ls="ls --color=auto"
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias get_pid='ps aux | grep -i'
alias ~='cd ~'  # go home
alias reload='source ~/.bashrc'


# extract:  Extract most known archives with one command
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'

#will return all results minus grep, useful for ps
grepv () {
 grep -i $1 | grep -v 'grep'	
}

#runs ps aux with grep -i var | grep -v 'grep'
fpid () {
 ps aux | grepv $1	
}

#runs fpid, prints the second column of ps aux (the process pid) and kills all processes in the list with -9
killprocs () {
 fpid $1 | awk '{print $2}' | xargs kill -9	
}

#sends a sig HUP to all processes found
killhup () {
 fpid $1 | awk '{print $2}' | xargs kill -HUP	
}

alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)
alias qfind="find . -name "                 # qfind:    Quickly search for file

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

# SCP Example to copy from server to local
#scp serveruser@exampleserver.com:/home/will/logs/* .

alias count_files="ls -l | wc -l"

alias memory_used='free | grep Mem | awk '\''{print $3/$2 * 100.0}'\'
alias memory_free='free | grep Mem | awk '\''{print $4/$2 * 100.0}'\'
alias refresh="source ~/.bashrc"

# Fix resize terminal funkiness 
export PROMPT_COMMAND="resize &>/dev/null ; $PROMPT_COMMAND"

# git rebase with n being the number of commits you need to access; change 'pick' to 'squash'
#git rebase -i HEAD~n

# Start Rabbitmq-Server
alias rabbitmq_start="service rabbitmq-server start"
alias rabbitmq_stop="service rabbitmq-server stop"
alias rabbitmq_status="rabbitmqctl status"

alias show_screen='screen -ls'
# Ctrl + a + c to create a new window
# Ctrl + a + d to detach from a window
# Ctrl + a + :sessionname to rename the session
alias reattach_screen='screen -r '  # then add id

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then source '/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then source '/opt/google-cloud-sdk/completion.bash.inc'; fi

# AWS keys are in ~/.aws/

docker-ip() {
  docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
}
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

alias gitlog='git log --pretty=format:"%Cgreen%<(12)%ar%Creset %CBlue%<(10,trunc)%an %Cred{%h <- %<(7,trunc)%p}%Creset %<(60,trunc)%s" --no-merges'
alias check_data='csvtool readable data.csv | view -'
alias gitlogf='git log --pretty=format:"%Cgreen%<(12)%ar%Creset %Cblue%<(10,trunc)%an %Cred{%h <- %<(7,trunc)%p}%Creset %<(60,trunc)%s" --numstat --no-merges'


# When displaying prompt to overwrite history, append instead
PROMPT_COMMAND='history -a'

# Make bash append to history than overwrite to disk
#shopt -s histappend

alias vpn_connect="expressvpn connect"
alias vpn_disconnect="expressvpn disconnect"
alias vpn_status="expressvpn status"

# wifi
alias wifi_list="nmcli d wifi list"
alias wifi_disconnect="nmcli d disconnect"  # <wifi_interface>
alias wifi_connect="nmcli d connect"  # <wifi_interface>

# copy/pasta
alias "copy=xclip"
alias "paste=xclip -o"

# Go To Go GitHub
alias cd_go_github="cd /home/will/go/src/github.com/williamqliu"


set show-mode-in-prompt on
bind 'set vi-ins-mode-string \1\e[0m\2::: \1\e[7m\2'
bind 'set vi-cmd-mode-string \1\e>>> [0m\2'

set -o vi

# for bracketed paste mode (to paste correctly)
printf "\e[?2004l"

# Networking
alias get_net_connections='lsof -i'  # show all open tcp/ip sockets
alias get_open_ports='sudo lsof -i | grep LIST'  # show all listening connections

# MySQL - replace user and password
#mysql -h 127.0.0.1 -uenteruser -enterpassword' -v < /path/to/myscript.sql

alias make_ctags="ctags -R -f ./.git/tags ."

