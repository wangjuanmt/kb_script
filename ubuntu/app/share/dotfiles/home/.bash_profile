[[ -f "$HOME/.profile" ]] && . $HOME/.profile

source $APP_SCRIPT_SHARE/start_ssh_agent.sh

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
