# !/bin/sh
# Install.sh of personal linux configuration
# This is for debianbased distros as it uses apt-get
# Made by sta957@github in v0.1 on 2020-04-11
#


# update and upgrade ppas

sudo apt update 
sudo apt -y upgrade


# install necessary packages 

sudo apt install -y git
sudo apt install -y speedtestcli
sudo apt install -y htop
sudo apt install -y neofetch

# modify .bashrc

$B_FILE = $HOME/.bashrc

# create .bashrc if not exists
if test -f "$B_FILE"; then
	touch "$B_FILE"
	echo "Creating $B_FILE"
fi	

echo '
alias ssys="sudo systemctl"
alias sai="sudo apt install"
alias saud="sudo apt update"
alias saug="sudo apt upgrade"
alias sus="sudo ufw status"
alias sun="sudo netstat -tulpn"
alias lsl="ls -l"
alias fucking="sudo"' | cat - "$B_FILE" > temp && mv temp "$B_FILE"


# modify .vimrc and install Vundle as packetmanager

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

$V_FILE= $HOME/.vimrc

if test -f "$B_FILE"; then
	touch "$B_FILE"
	echo "Creating $V_FILE"
fi

echo "
set nocompatible              \" be iMproved, required
filetype off                  \" required
\" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
\" alternatively, pass a path where Vundle should install plugins
\"call vundle#begin(\'~/some/path/here\')
\" let Vundle manage Vundle, required
Plugin \'VundleVim/Vundle.vim\'
\" The following are examples of different formats supported.
\" Keep Plugin commands between vundle#begin/end.
\" plugin on GitHub repo
Plugin \'tpope/vim-fugitive\'
\" plugin from http://vim-scripts.org/vim/scripts.html
\" Plugin \'L9\'
\" Git plugin not hosted on GitHub
Plugin \'git://git.wincent.com/command-t.git\'
\" git repos on your local machine (i.e. when working on your own plugin)
Plugin \'file:///home/gmarik/path/to/plugin\'
\" The sparkup vim script is in a subdirectory of this repo called vim.
\" Pass the path to set the runtimepath properly.
Plugin \'rstacruz/sparkup\', {\'rtp\': \'vim/\'}
\" Install L9 and avoid a Naming conflict if you\'ve already installed a
\" different version somewhere else.
\" Plugin \'ascenator/L9\', {\'name\': \'newL9\'}
\" All of your Plugins must be added before the following line
call vundle#end()            \" required
filetype plugin indent on    \" required
\" To ignore plugin indent changes, instead use:
\"filetype plugin on
\"" | cat - "$V_FILE" > temp && mv temp "$V_FILE"

vim +PluginInstall +qall

echo "\n\n\n
set number
set ruler
set smartcase
set mouse=a
set paste
set hlsearch
set background=dark
set termguicolors

colorscheme breezy
let g:airline_theme='breezy'
let python_highlight_all=1
" >> "$V_FILE"

