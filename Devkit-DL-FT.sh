#!/bin/bash

# This script installs Atari-PS4 DevKitPro to M1 Mac all devkits.

# Check if the user is an administrator.
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as an administrator."
  exit 1
fi

# Check if the required tools are installed.
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Please install Homebrew before running this script."
  exit 1
fi

# Install the required tools.
brew install git cmake ninja llvm clang

# Create the DevKitPro directory.
mkdir -p ~/DevKitPro

# Change to the DevKitPro directory.
cd ~/DevKitPro

# Clone the Atari-PS4 DevKitPro repository.
git clone https://github.com/devkitpro/atari-ps4.git

# Change to the Atari-PS4 DevKitPro directory.
cd atari-ps4

# Configure the build system.
cmake .

# Generate the build files.
ninja

# Install the development tools.
sudo make install

# Success!
echo "Atari-PS4 DevKitPro has been installed successfully."
