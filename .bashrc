# Paths
export PATH="$PATH:/usr/bin/"
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:/opt/pycharm-2017.1.2/bin/"

# Colors
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
force_color_prompt=yes

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

LS_COLORS=$LS_COLORS:'di=0;92:' ;
export LS_COLORS

alias ls="ls --color=auto"

# Virtualenv wrapper
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
source /usr/local/bin/virtualenvwrapper.sh

# Golang
export PATH="$PATH:$HOME/go/bin"
export GOPATH=$(go env GOPATH)
export GOBIN="$PATH:$HOME/go/bin"

# Alias
alias v="nvim"
alias vim="nvim"
alias open="gnome-open"
alias python="python3"
alias ipython="ipython3"
alias pip="pip3"

# Git
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR="$VISUAL"

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

export MYSQL_PS1="(\u@\h) [\d]> "

set show-mode-in-prompt on
bind 'set vi-ins-mode-string \1\e[0m\2::: \1\e[7m\2'
bind 'set vi-cmd-mode-string \1\e>>> [0m\2'

set -o vi
