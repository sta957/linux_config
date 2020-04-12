# !/bin/sh
# Install.sh of personal linux configuration
# This is for debian-based distros as it uses apt-get
# An internet connection is required!
#
# Made by sta957@github in v0.1 on 2020-04-11
#

helpFunction(){
	echo ""
	echo "Usage: $0 -u -s -p -h hostname123"
	echo -e "\t-u Set ufw-settings (only ssh and http/s)"
   	echo -e "\t-s Setup a mariadb sql-server"
   	echo -e "\t-p Add the python configuration to this machine"
	echo -e "\t-h Set hostname to given value"
   	exit 1 # Exit script after printing help
}

# update and upgrade ppas

sudo apt update 
sudo apt -y upgrade

# install necessary packages 

sudo apt install -y git
sudo apt install -y speedtestcli
sudo apt install -y htop
sudo apt install -y neofetch


# modify .bashrc

B_FILE="$HOME/.bashrc"

# create .bashrc if not exists
if test ! -f $B_FILE; then
	touch "$B_FILE"
	echo "Creating $B_FILE"
fi	

echo ':
alias ssys="sudo systemctl"
alias sai="sudo apt install"
alias saud="sudo apt update"
alias saug="sudo apt upgrade"
alias sus="sudo ufw status"
alias sun="sudo netstat -tulpn"
alias lsl="ls -l"
alias fucking="sudo"' | cat - $B_FILE > temp && mv temp "$B_FILE"

. "$B_FILE" # enable .bashrc changes


# modify .vimrc and install Vundle as packetmanager

if test ! -f "/$HOME/.vim/bundle/Vundle.vim"; then
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

V_FILE="$HOME/.vimrc"

if test ! -f "$V_FILE"; then
	touch "$V_FILE"
	echo "Creating $V_FILE"
fi

echo "
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

\" personal plugins can be installed here
Plugin 'vim-airline/vim-airline'
Plugin 'fneu/breezy'

call vundle#end()
filetype plugin indent on

\" personal configuration 
set number
set ruler
set smartcase
set mouse=a
set paste
set hlsearch
set background=dark
set termguicolors

let g:airline_theme='breezy'
let python_highlight_all=1

\"keybindings

nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
" >> "$V_FILE"

vim +PluginInstall +qall

# set ufw-settings

if [ echo $* | grep -e "--ufw" -q ] || [ echo $* | grep -e "-u" -q ]; then
	echo "\nConfiguring UFW\n"
	if [ -n sudo dpkg --get-selections | grep ufw ]; then
		echo "Installing ufw"
		sudo apt install ufw
	fi
	sudo ufw allow ssh/tcp
	sudo ufw allow 80/tcp
	sudo ufw allow 8080/tcp
	sudo ufw allow 443/tcp
	sudo ufw allow 8443/tcp
	sudo ufw enable
	echo "UFW Configuration set successfully!\n"
	sudo ufw status numbered
fi


# configure sql-server

if echo $* | grep -e "--sql" -q or echo $* | grep -e "-s" -q; then
	echo "\nConfiguring SQL-Server\n"
	if [ -n sudo dpkg --get-selections | grep mariadb-server ]; then
		echo "Installing mariadb-server"
		sudo apt install mariadb-server
	fi
	/usr/bin/mysql_secure_installation
	service mysql start
	service mysql enable
fi


# set python configuration

if echo $* | grep -e "--ufw" -q or echo $* | grep -e "-u" -q; then
	echo "\nConfiguring Python\n"
	if [ -n sudo dpkg --get-selections | grep python3 ]; then
		echo "Installing python3.6"
		sudo apt install python3.6
	fi
	if [ -n sudo dpkg --get-selections | grep python3-pip ]; then
		echo "Installing pip3"
		sudo apt install python3-pip
	fi
	if [ -n sudo dpkg --get-selections | grep python3.6-venv ]; then
		echo "Installing virtualenv"
		sudo pip3 install virtualenv
	fi
	echo "\nActual python version:\n"
	echo "$(python3 --version)" 
	echo ""
fi

# set hostname to machine

if echo $* | grep -e "--ufw" -q or echo $* | grep -e "-u" -q; then
	echo "\nSetting hostname to xy\n"
	echo "Please enter a hostname"
	read -p "Hostname:" hostname_var
	if [ -n $hostname_var]; then
		sudo echo $hostname_var > /etc/hostname
		sudo echo $hostname_var >> /etc/hosts
fi

echo ""
echo "Successfully modified and installed the system for yout purposes Timo"
echo ""
echo "			---- Have a nice day :) ----"

