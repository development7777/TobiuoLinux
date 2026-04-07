#!/bin/bash
set -e

echo "--- Starting Tobiuo Linux Customization ---"

# Ensure non-interactive apt installation
export DEBIAN_FRONTEND=noninteractive

# Update package lists
echo "--- Updating package lists ---"
apt-get update

# Brave Browser Installation
echo "--- Installing Brave Browser ---"
# Use apt-get -y for automatic "Yes" to prompts
apt-get install -y curl gnupg

# Fetch GPG key
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Add Brave sources (using the .sources format you provided)
curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources

# Update and install
apt-get update
apt-get install -y brave-browser

# 3. Identity and Services
echo "--- Configuring system identity and services ---"
# Set hostname (optional but recommended here)
echo "tobiuo-linux" > /etc/hostname

# Enable essential services
systemctl enable sddm
systemctl enable NetworkManager

echo "--- Customization Completed! ---"
