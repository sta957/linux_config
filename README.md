# linux_config
My personal linux configuration to stay producitve on every server.

## What get's modified?

Config | Desc | Mandantory
--- | --- | ---
.vimrc | Vundle, kite, airline-vim, breezy, shortcuts,... | x
.bashrc | Set my own aliase and shortcuts. Also the colorset gets changed | x
tools | Install tools like htop, neofetch, speedtestcli, git | x
ufw | set ufw-settings to only allow ssh as standard-traffic |
python | installs latest python, pip, venv | 

## How does it work ?

The repo contains a simple bash-script('install.sh') to copy all files to their places. This script must be run as sudo to reach all directories.

## Script Commandline Arguments

Argument | Desc | Now Implemented
--- | --- | ---
--ufw -u | Sets and enables ufw as firewall | No
--sql -s | sets up mariadb for this machine | No
--python -p | creates python development environement | No
--hostname -h | sets hostname for machine | No

# Ideas for the future will be noted here
