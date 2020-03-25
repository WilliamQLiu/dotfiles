# -------------------------------------------------------------------
# SECTIONS
#
# 0. Vim
# 1. Environment Configuration
# 2. Terminal Commands
# 3. File and Folder Management
# 4. Searching
# 5. Process Management
# 6. Networking
# 7. System Operations and Information
# 8. Web Dev
# 9. Secrets (stored in .secrets)
# 10. Database
# 11. Docker, Docker Compose, Docker Hub
# 12. Git
# 13. Applications
# 14. Ruby
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# 0. Vim
# -------------------------------------------------------------------

# Activate vim mode.
bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

# -------------------------------------------------------------------
# 1. Environment Configuration
# -------------------------------------------------------------------

# Change Prompt
export PROMPT='%~ %#'

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

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

# -------------------------------------------------------------------
# 2. Terminal Commands
# -------------------------------------------------------------------

# Change to my default programs
alias ipython="ipython3"
alias open="gnome-open"
alias pip="pip3"
alias python="python3"
alias vim="nvim"

# -------------------------------------------------------------------
# 3. File and Folder Management
# -------------------------------------------------------------------

# Make terminal commands better
alias c='clear'                             # clear terminal display
alias cp='cp -iv'                           # cp with interactive and verbose flags
alias mkdir='mkdir -pv'                     # make directories as needed
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias get_pid='ps aux | grep -i'
alias ~='cd ~'                              # go home

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

# SCP from local to server
#scp myfile myuser@myserver:/tmp/mydir/

alias count_files="ls -l | wc -l"
alias memory_used='free | grep Mem | awk '\''{print $3/$2 * 100.0}'\'
alias memory_free='free | grep Mem | awk '\''{print $4/$2 * 100.0}'\'

# copy/pasta
alias "copy=xclip"
alias "paste=xclip -o"

# for bracketed paste mode (to paste correctly)
printf "\e[?2004l"

# Networking
alias get_net_connections='lsof -i'  # show all open tcp/ip sockets
alias get_open_ports='sudo lsof -i | grep LIST'  # show all listening connections

# Show what is being used at port number, e.g. at port 8000 then will grep 8000
inspect_port_number() {
    sudo netstat -pna | grep $1
}
alias make_ctags="ctags -R -f ./.git/tags ."

alias netstat_see_network_connections="netstat -tulpn"
alias remove_pyc_files="find . -name \*.pyc -delete"  # delete pesky .pyc files lying around

# LaTeX editor
alias te="texmaker"

alias check_disk_usage_sort='du -hs * | sort -h'
#alias find_files_print='find /tmp -maxdepth 1 -mtime -1 -type f -name "DBG_A_sql*" -print'  # replace type f to d for directories
#alias find_files_delete='find /tmp -maxdepth 1 -mtime -1 -type f -name "DBG_A_sql*" -delete'
#alias search_for_files="ag --py 'mock' ."  # search for word like 'mock'

# -------------------------------------------------------------------
#  9. Secrets
# -------------------------------------------------------------------
source ~/.secrets

# -------------------------------------------------------------------
# 11. Docker, Docker Compose, Docker Hub
# -------------------------------------------------------------------

### Docker

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

# Inspect mounts on specific containerid
docker_inspect_mounts() {
	docker inspect -f '{{ .Mounts }}' $1
}


### Docker Compose

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

### Docker Hub

# login to dockerhub
dockerhub_login() {
    docker login
}

# pull a docker image from dockerhub, e.g williamqliu/go-app
dockerhub_run_image() {
    docker pull $1
}

# -------------------------------------------------------------------
# 12. Git
# -------------------------------------------------------------------

alias gitlog='git log --pretty=format:"%Cgreen%<(12)%ar%Creset %CBlue%<(10,trunc)%an %Cred{%h <- %<(7,trunc)%p}%Creset %<(60,trunc)%s" --no-merges'
alias gitlogf='git log --pretty=format:"%Cgreen%<(12)%ar%Creset %Cblue%<(10,trunc)%an %Cred{%h <- %<(7,trunc)%p}%Creset %<(60,trunc)%s" --numstat --no-merges'
alias git_log_dog='git log --all --decorate --oneline --graph'
alias git_log='git log --all --decorate --oneline --graph'

# Example of showing entire history for a specific file
git_log_follow()
{
    git log --follow -p -- $1
}

# e.g. git checkout master -- myfile.py to get myfile.py from master branch
git_checkout_file_on_branch() {
    git checkout $1 -- $2
}
# git checkout <filename>
# git checkout mybranch -- file1/to/restore file2/to/restore
# git checkout mybranch~1 -- file1/to/restore file2/to/restore

# -------------------------------------------------------------------
# 13. Applications
# -------------------------------------------------------------------

## RabbitMQ
alias rabbitmq_start="service rabbitmq-server start"
alias rabbitmq_stop="service rabbitmq-server stop"
alias rabbitmq_status="rabbitmqctl status"

## Screen
alias show_screen='screen -ls'
# Ctrl + a + c to create a new window
# Ctrl + a + d to detach from a window
# Ctrl + a + :sessionname to rename the session
alias reattach_screen='screen -r '  # then add id

## Csvtool
alias check_data='csvtool readable data.csv | view -'

## Vim
# Search and Replace in vim
#/[,]   # searches for comma
#:s//&\r/g
#s// means an empty find pattern, use last search
#& means insert the search hit (for this its a comma)
# in the replacement, \r inserts a new line

# Remove last char in each line from previous search
#:%s/.\{1}$//

# Add comma to end of each line
# :%s/$/\,/g

# Select text in visual mode, then:
# sort u

# Trim trailing whitespace
#:%s/\s\+$//e

# -------------------------------------------------------------------
# 14. Ruby
# -------------------------------------------------------------------

# Rspec (Tests)
alias run_rspec="bundle exec rspec -f d"  # format documentation

# Rubocop
alias run_rubocop="rubocop -a"  # run rubocop and automatically format

## Ruby Gemsets
alias rvm_gemset_list="rvm gemset list"  # list gemsets for your current rvm
alias rvm_gemset_list_all="rvm gemset list_all" # list all named gemsets for all interpreters


