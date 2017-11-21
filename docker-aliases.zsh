alias dc="docker-compose"
# Interactive run/remove
alias drun='docker run -it --rm'
# Stop all containers
alias dstop='docker stop $(docker ps -a -q)'
# Remove all containers
alias drm='docker rm $(docker ps -a -q)'
# Stop and remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# Remove all images
alias dri='docker rmi $(docker images -q)'
# Processes
alias dps='docker ps'
alias dpsa='docker ps -a'
# show used space
alias dsdf='docker system df'
# Remove orphaned volumes
# alias dclean='docker volume rm $(docker volume ls -qf dangling=true)'
alias dclean='docker system prune'
# useful stats
alias dstats='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"'
# Show all aliases related to docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
