#!/bin/bash

alias bat="batcat"
#alias fd="fd-find"
alias emacs="emacs -nw"
# Calculator

alias bc="bc -l"

# Clear

alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"

# Change Directories

alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

# useful Docker functions

dock-run() { sudo docker run -i -t --privileged $@; }
dock-exec() { sudo docker exec -i -t $@ /bin/bash; }
dock-log() { sudo docker logs --tail=all -f $@; }
dock-port() { sudo docker port $@; }
dock-vol() { sudo docker inspect --format '{{ .Volumes }}' $@; }
dock-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@; }
dock-rmc() { sudo docker rm sudo docker ps -qa --filter 'status=exited'; }
dock-rmi() { sudo docker rmi -f sudo docker images | grep '^<none>' | awk '{print $3}'; }
dock-stop() { sudo docker stop $(docker ps -a -q); }
dock-rm() { sudo docker rm $(docker ps -a -q); }

#*dock-do() { if [ "$#" -ne 1 ]; then echo "Usage: $0 start|stop|pause|unpause|" fi
#for c in $(sudo docker ps -a | awk '{print $1}' | sed "1 d") do sudo docker $1 $c done }

# Kubernetes commands
alias k="kubectl"
alias ka="kubectl apply -f"
alias kpa="kubectl patch -f"
alias ked="kubectl edit"
alias ksc="kubectl scale"
alias kex="kubectl exec -i -t"
alias kg="kubectl get"
alias kga="kubectl get all"
alias kgall="kubectl get all --all-namespaces"
alias kinfo="kubectl cluster-info"
alias kdesc="kubectl describe"
alias ktp="kubectl top"
alias klo="kubectl logs -f"
alias kn="kubectl get nodes"
alias kpv="kubectl get pv"
alias kpvc="kubectl get pvc"

# Docker commands
alias dl="sudo docker ps -l -q"
alias dps="sudo docker ps"
alias di="sudo docker images"
alias dip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkd="sudo docker run -d -P"
alias dki="sudo docker run -i -t -P"
alias dex="sudo docker exec -i -t"
