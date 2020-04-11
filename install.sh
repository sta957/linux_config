# !/bin/sh
# Install.sh of personal linux configuration
# This is for debian-based distros as it uses apt-get
# An internet connection is required!
#
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
