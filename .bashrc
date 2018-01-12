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
source ~/.git-prompt.sh  # see repository status in shell (e.g. on master branch)
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

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

# Colors
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
force_color_prompt=yes
LS_COLORS=$LS_COLORS:'di=0;92:' ;
export LS_COLORS

alias ls="ls --color=auto"

# Virtualenv wrapper
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
source /usr/local/bin/virtualenvwrapper.sh

# Alias
alias v="nvim"
alias vim="nvim"
alias open="gnome-open"
alias python="python3"
alias ipython="ipython3"
alias pip="pip3"

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

# Terminal Defaults
alias cp='cp -iv'  # Preferred 'cp'
alias mkdir='mkdir -pv'  # Make directories as needed

cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'

alias get_pid='ps aux | grep -i'
alias ~='cd ~'  # go home
alias reload='source ~/.bashrc'
