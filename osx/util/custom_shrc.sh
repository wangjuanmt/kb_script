alias ll="ls -alFGh"

# To see all settings, "pmset -g custom"
alias never_sleep="sudo pmset -b sleep 0 displaysleep 0;sudo pmset -c sleep 0 displaysleep 0"
alias cancel_never_sleep="sudo pmset -b sleep 10 displaysleep 10;sudo pmset -c displaysleep 15"
alias lock_screen="pmset displaysleepnow"

# http://geoff.greer.fm/lscolors/
#export LSCOLORS="exfxcxdxbxegedabagacad"

# https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Not necessary
#export DOCKER_HOST=unix:///var/run/docker.sock
