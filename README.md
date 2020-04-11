# linux_config
My personal linux configuration to stay producitve on every server.

## What get's modified?

Config | Desc
--- | ---
.vimrc | Things like line-numbers and syntax highlighting
.bashrc | Set my own aliase and shortcuts. Also the colorset gets changed
tools | Install tools like htop, neofetch, speedtestcli, 
ufw | set ufw-settings to only allow ssh as standard-traffic


## How dows it work ?

The repo contains a simple bash-script('install.sh') to copy all files to their places. This script must be run as sudo to reach all directories. 
