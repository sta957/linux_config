# linux_config
My personal linux configuration to stay producitve on every server.

## What get's modified?

Config | Desc | Mandantory
--- | --- | ---
.vimrc | Things like line-numbers and syntax highlighting | x
.bashrc | Set my own aliase and shortcuts. Also the colorset gets changed | x
tools | Install tools like htop, neofetch, speedtestcli, git | 
ufw | set ufw-settings to only allow ssh as standard-traffic |


## How dows it work ?

The repo contains a simple bash-script('install.sh') to copy all files to their places. This script must be run as sudo to reach all directories. 
