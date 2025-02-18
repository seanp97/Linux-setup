#!/bin/bash

echo "Updating package list..."
sudo apt update -y

echo "Installing dependencies..."
sudo apt install -y wget gpg

packages=(
    "curl"
    "git"
    "docker.io"
    "docker-compose"
    "nmap"
    "mysql-client"
    "python3"
    "python3-pip"
    "default-jdk"
    "nodejs"
    "npm"
    "php"
    "php-cli"
    "php-mbstring"
    "openjdk-11-jdk"
    "gh"
)

for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo apt install -y "$package"
done

sudo snap install kotlin --classic

sudo apt install -y wget unzip

# Set download URLs
VS_CODE_DEB="https://code.visualstudio.com/sha/download?build=stable&os=deb"
CHROME_DEB="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
GITHUB_DEB="https://github.com/shiftkey/desktop/releases/download/release-3.1.1-linux1/GitHubDesktop-linux-3.1.1-linux1.deb"

# Set download directory
DOWNLOAD_DIR="$HOME/Downloads"
mkdir -p "$DOWNLOAD_DIR"

# Install gdebi (if not installed)
echo "Checking for gdebi..."
if ! command -v gdebi &> /dev/null; then
    echo "Installing gdebi..."
    sudo apt update && sudo apt install -y gdebi-core
fi

# Download and install VS Code
echo "Downloading VS Code..."
wget -O "$DOWNLOAD_DIR/vscode.deb" "$VS_CODE_DEB"
echo "Installing VS Code..."
sudo gdebi -n "$DOWNLOAD_DIR/vscode.deb"

# Download and install Google Chrome
echo "Downloading Google Chrome..."
wget -O "$DOWNLOAD_DIR/google-chrome.deb" "$CHROME_DEB"
echo "Installing Google Chrome..."
sudo gdebi -n "$DOWNLOAD_DIR/google-chrome.deb"

# Download and install GitHub Desktop
echo "Downloading GitHub Desktop..."
wget -O "$DOWNLOAD_DIR/github-desktop.deb" "$GITHUB_DEB"
echo "Installing GitHub Desktop..."
sudo gdebi -n "$DOWNLOAD_DIR/github-desktop.deb"

# Cleanup
rm "$DOWNLOAD_DIR/vscode.deb" "$DOWNLOAD_DIR/google-chrome.deb" "$DOWNLOAD_DIR/github-desktop.deb"

echo "VS Code, Google Chrome, and GitHub Desktop have been installed successfully!"
