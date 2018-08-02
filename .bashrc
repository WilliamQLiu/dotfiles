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
# 9. Secrets (stored in .secrets)
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
export GIT_EDITOR=nvim
export VISUAL=nvim
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
#export PROMPT_COMMAND="resize &>/dev/null ; $PROMPT_COMMAND"

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
alias git_log_dog='git log --all --decorate --oneline --graph'
alias git_log='git log --all --decorate --oneline --graph'


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

# Show what is being used at port number, e.g. at port 8000 then will grep 8000
inspect_port_number() {
    sudo netstat -pna | grep $1
}

# MySQL - replace user and password on below queries
#mysql -h 127.0.0.1 -uenteruser -enterpassword' -v < /path/to/myscript.sql
#mysqldump -t -u enterusername --password='mypassword' -h myhost myserver mytable --where="some_filter='A'"
#  -t means do not make CREATE TABLE statements

# MySQL select and dump into localhost's csv (notice it has tabular output (the "boxing" around columns); can choose to not have by using --batch or --raw
# MySQL select from server and dump into localhost csv file (replace tabs with commas)
#mysql -u enterusername --password='mypassword' -h myhost myserver mytable -e "SELECT x FROM mytable" | tr '\t' , > myQuery.csv
# MySQL load file into MySQL Server using file from localhost
#mysql -u enterusername --password='mypassword' -h myhost myserver mytable -e "LOAD DATA LOCAL INFILE '/home/will/myFile.csv' INTO mytable LINES TERMINATED BY '\n' IGNORE 1 LINES";

alias make_ctags="ctags -R -f ./.git/tags ."

# Example of showing entire history for a specific file
git_log_follow()
{
    git log --follow -p -- $1
}

## Docker

# inspect details on a container name (e.g. if running, what port, what IP Address)
docker_inspect_container_ip() {
    docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
}

docker_events() {
    docker events&
}


# build a docker image and tag with name
docker_build_target() {
    docker build -t $1 .
}

docker_run_image() {
    docker run $1
}

# inspect a docker image
docker_inspect_container() {
    docker inspect $1
}

# ssh into a docker container
docker_ssh_container() {
    docker exec -t -i $1 /bin/bash
}

# list all your images that you pulled
docker_list_images() {
    docker images
}

# list all your volumes
docker_list_volumes() {
    docker volume ls
}

# remove dangling docker images
docker_remove_dangling_images() {
    docker rmi -f $(docker images -qf dangling=true)
}

# remove dangling docker volumes
docker_remove_dangling_volumes() {
    docker volume rm $(docker volume ls -qf dangling=true)
}

# remove exited containers
docker_remove_exited_containers() {
    docker rm -v $(docker ps -a -q -f status=exited)
}

# list all docker containers that are running (including container id)
docker_list_containers() {
    docker ps -a
}

# pull the docker logs for a container
docker_logs() {
    docker logs $1
}

# removes a docker container
docker_remove_container() {
    docker rm $1
}

# show public facing ports for a docker container
docker_list_container_ports() {
    docker port $1
}

# stop a docker container
docker_stop_container() {
    docker stop $1
}

# Check port number to see if used
docker_check_port() {
    sudo lsof -i :$1 | grep LISTEN
}

# spin up a busybox container and ping the container named 'spark' 5 times
docker_test_network() {
    docker run --rm --net=my-net busybox ping -c 5 spark
}


## Docker Compose

# bring up containers
docker_compose_up() {
    docker-compose up
}

# bring up containers and rebuild when bringing up
docker_compose_up_and_rebuild() {
    docker-compose up --build
}

# build w/ docker compose
docker_compose_build() {
    docker-compose build
}

# bring down containers
docker_compose_down() {
    docker-compose down
}

# list docker-compose containers/apps
docker_compose_list_containers() {
    docker-compose ps
}

# run a one time script from one container to another
# e.g. docker exec -it my_web_app_1 ping -c 2 my_db_1
docker_exec_between_containers() {
    echo "To Do"
}

# docker run one time script on a container
#e.g. docker-compose run my_web_app_1 python /web/hipflask/create_db.py
docker_run_script() {
    echo "To Do"
}

## Docker Hub

# login to dockerhub
dockerhub_login() {
    docker login
}

# pull a docker image from dockerhub, e.g williamqliu/go-app
dockerhub_run_image() {
    docker pull $1
}

# run a docker image from dockerhub, e.g williamqliu/go-app
dockerhub_run_image() {
    docker run $1
}

alias netstat_see_network_connections="netstat -tulpn"
alias remove_pyc_files="find . -name \*.pyc -delete"  # delete pesky .pyc files lying around

if [ -e .secrets ]
then
    source .secrets
else
    :
fi

# Needed for neovim
export VTE_VERSION="100"

# LaTeX editor
alias te="texmaker"

# Make key repeat much faster
xset r rate 200 60

# Setup configs for Hadoop and Spark
export CLASSPATH='$CLASSPATH:/usr/share/java/mysql-connector-java.jar'
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
export HADOOP_HOME=/usr/local/hadoop-3.0.0/
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
#export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop/
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop/
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native/

alias run_xset="xset r rate 200 60"
export MYVIMRC="~/.vimrc"

export AIRFLOW_HOME="~/airflow"
alias kill_airflow_server="cat $AIRFLOW_HOME/airflow-webserver.pid | xargs -9"

alias check_ip_port_listening="netstat -antlp"

# e.g. git checkout master -- myfile.py to get myfile.py from master branch
git_checkout_file_on_branch() {
    git checkout $1 -- $2
}

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

alias check_disk_usage_sort='du -hs * | sort -h'
alias find_files_print='find /tmp -maxdepth 1 -mtime -1 -type f -name "DBG_A_sql*" -print'  # replace type f to d for directories
alias find_files_delete='find /tmp -maxdepth 1 -mtime -1 -type f -name "DBG_A_sql*" -delete'
alias search_for_files="ag --py 'mock' ."  # search for word like 'mock'

