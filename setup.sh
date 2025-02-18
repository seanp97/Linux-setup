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
