#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

LOG_FILE=neovim_setup_log.txt

log_message() { echo "[ $(date) ] $1" >> "$LOG_FILE"; }

command_exists() { command -v "$1" &> /dev/null; }

NVIM_LUA_CONFIG_FILE=~/.config/nvim/lua/theanuragshukla/packer.lua

echo -e "${GREEN}Starting Neovim setup${NC}\n"

if ! command_exists git; then
	echo -e "${RED}Git is not installed. Please install Git before running this script.${NC}"
	log_message "Error: Git is not installed."
	exit 1
fi

read -p "This script will install Neovim and set up the configuration. Continue? (y/n): " choice

case "$choice" in
	[yY]|[yY][eE][sS])
		echo -e "${GREEN}Proceeding with the setup...${NC}"
		;;
	*)
		echo -e "${RED}Aborted.${NC}"
		log_message "Setup aborted by the user."
		exit 1
		;;
esac

# Check Neovim version
NVIM_VERSION=$(nvim --version | grep -oP '(?<=NVIM v)[0-9]+')

if [ "$NVIM_VERSION" -lt 8 ]; then
	echo -e "${GREEN}Building Neovim from source...${NC}"
	sudo apt remove neovim
	sudo rm -rf /bin/nvim
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
	git clone https://github.com/neovim/neovim.git
	cd neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
	sudo cp ./build/bin/nvim /bin
	cd ..
fi


PACKER_DIR=~/.local/share/nvim/site/pack/packer/start
NVIM_CONFIG_DIR=~/.config/nvim
NVIM_SOURCE_DIR=$(pwd)/nvim

log_message "Neovim installation complete."

if [ -d "$PACKER_DIR/packer.nvim" ]; then
	echo -e "${GREEN}Packer.nvim is already installed. Skipping installation.${NC}"
	log_message "Packer.nvim is already installed."
else
	echo -e "${GREEN}Pulling packer.nvim from GitHub...${NC}\n"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_DIR/packer.nvim

	if [ $? -eq 0 ]; then
		echo -e "${GREEN}Packer.nvim installed!${NC}\n"
		log_message "Packer.nvim installation complete."
	else
		echo -e "${RED}Failed to install packer.nvim. Exiting.${NC}"
		log_message "Failed to install packer.nvim."
		exit 1
	fi
fi


echo -e "${GREEN}Copying config files from $NVIM_SOURCE_DIR to $NVIM_CONFIG_DIR${NC}"
rm -rf $NVIM_CONFIG_DIR
cp -r $NVIM_SOURCE_DIR $NVIM_CONFIG_DIR/

if [ $? -eq 0 ]; then
	echo -e "${GREEN}Configuration files copied.${NC}"
else
	echo -e "${RED}Failed to copy configuration files. Exiting.${NC}"
	log_message "Failed to copy configuration files to $NVIM_CONFIG_DIR."
	exit 1
fi

echo -e "${GREEN}Running Neovim to sync and install plugins...${NC}"

nvim --headless -u $NVIM_LUA_CONFIG_FILE +PackerSync +qall

log_message "Neovim setup completed."

echo -e "${GREEN}Neovim setup completed!${NC}"

