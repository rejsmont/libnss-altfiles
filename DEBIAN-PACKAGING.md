# Building libnss-altfiles Debian Package

This repository contains the Debian packaging for the `libnss-altfiles` NSS module.

## Prerequisites (Debian/Ubuntu systems)

Install the required build tools:

```bash
sudo apt-get update
sudo apt-get install build-essential debhelper devscripts fakeroot
```

## Building the Package

### Method 1: Using the provided script

```bash
./build-package.sh
```

### Method 2: Manual build

1. Check build dependencies:
```bash
dpkg-checkbuilddeps
```

2. Build the package:
```bash
dpkg-buildpackage -us -uc -b
```

The built `.deb` files will be created in the parent directory.

## Package Contents

- `libnss-altfiles` - The main package containing the NSS module library
- `libnss-altfiles-docs` - Documentation package (if built separately)

## Installation

After building:

```bash
sudo dpkg -i ../libnss-altfiles_*.deb
```

## Configuration

Add `altfiles` to your `/etc/nsswitch.conf`:

```
passwd: files altfiles
group:  files altfiles
shadow: files altfiles
gshadow: files altfiles
```

## File Structure

The package installs:
- `/lib/<arch>/libnss_altfiles.so.2` - The NSS module library

The module reads alternative files from:
- `/lib/passwd` (alternative to `/etc/passwd`)
- `/lib/group` (alternative to `/etc/group`)
- `/lib/shadow` (alternative to `/etc/shadow`)
- `/lib/gshadow` (alternative to `/etc/gshadow`)
- And other supported file types

## Debugging

To verify the package build configuration without building:

```bash
# Check control file syntax
dpkg-parsechangelog
cat debian/control

# Verify files list
cat debian/libnss-altfiles.install
```

## Notes

- The package is configured to support all NSS file types (`--with-types=all`)
- Libraries are installed to `/lib/<multiarch>/` for multi-arch support
- Data files are expected in `/lib/` by default
- The package follows Debian Policy version 4.6.2