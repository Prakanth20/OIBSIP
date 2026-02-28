#!/bin/bash

# Basic UFW Firewall Configuration Script

echo "Updating system..."
sudo apt update

echo "Installing UFW..."
sudo apt install -y ufw

echo "Setting default policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "Allowing SSH..."
sudo ufw allow 22/tcp

echo "Denying HTTP..."
sudo ufw deny 80/tcp

echo "Enabling UFW..."
sudo ufw --force enable

echo "Displaying UFW Status..."
sudo ufw status verbose
