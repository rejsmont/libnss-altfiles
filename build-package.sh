#!/bin/bash

# Build script for libnss-altfiles Debian package
# Run this on a Debian/Ubuntu system with build tools installed

set -e

echo "=== Building libnss-altfiles Debian package ==="

# Check if we're in the right directory
if [[ ! -f "debian/control" ]]; then
    echo "Error: debian/control not found. Please run this from the project root."
    exit 1
fi

# Install build dependencies (requires sudo)
echo "Installing build dependencies..."
sudo apt-get update
sudo apt-get install -y build-essential debhelper devscripts fakeroot

# Check build dependencies
echo "Checking build dependencies..."
dpkg-checkbuilddeps

# Clean any previous builds
echo "Cleaning previous builds..."
debian/rules clean

# Build source package
echo "Building source package..."
dpkg-source --build .

# Build binary package
echo "Building binary package..."
dpkg-buildpackage -us -uc -b

echo "=== Build complete! ==="
echo "Package files should be in the parent directory:"
ls -la ../libnss-altfiles*.deb 2>/dev/null || echo "No .deb files found yet - check build output above"