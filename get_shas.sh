#!/usr/bin/env bash

# Function to compute SHA hash for a given URL
compute_sha() {
    local url=$1
    nix shell nixpkgs/nixos-unstable#nix-prefetch-git --command nix-prefetch-url --unpack --type sha256 "$url"
}

# Prompt user for version number
read -rp "Please enter the version number: " version

# Construct URLs
url_aarch="https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz"
url_x86="https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz"

# Compute SHA hashes
sha_x86=$(compute_sha "$url_x86")
sha_aarch=$(compute_sha "$url_aarch")

# Pretty print the results
echo " aarch64:   sha256 = \"sha256:$sha_aarch\";"
echo " x86:   sha256 = \"sha256:$sha_x86\";"
