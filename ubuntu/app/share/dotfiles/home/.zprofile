if [ -f "$HOME/.profile" ]; then
   . "$HOME/.profile"
fi

source $APP_SCRIPT_SHARE/start_ssh_agent.sh
