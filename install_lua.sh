#!/bin/bash

# Script to install Lua

# Exit immediately if a command exits with a non-zero status.
set -e

# Version of Lua to install
LUA_VERSION="5.4.6"

# Install necessary dependencies
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y build-essential wget tar libreadline-dev

# Download Lua source code
echo "Downloading Lua $LUA_VERSION..."
cd /tmp
wget https://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz

# Extract the tarball
echo "Extracting Lua $LUA_VERSION..."
tar -zxf lua-$LUA_VERSION.tar.gz
cd lua-$LUA_VERSION

# Build and install Lua
echo "Building Lua..."
make linux test

echo "Installing Lua..."
sudo make install

# Cleanup
echo "Cleaning up..."
cd /tmp
rm -rf lua-$LUA_VERSION.tar.gz lua-$LUA_VERSION

# Verify the installation
echo "Lua installation completed."
lua -v
