[**Debian 12 (bookworm)**](https://www.debian.org/releases/bookworm/)

# Why Debian ?

- Made of free and open source software and will always be 100% free.
- Stable, secure and relable.
- Large communitity.
- Server version available.

See https://www.debian.org/intro/why_debian for more.

# Download

1. [Download](https://www.debian.org/distrib/netinst) the corresponding ISO image for your architecture.
2. Create a bootable USB with this ISO.

# Installation

1. Go to the BIOS and disable **Secure Boot**.
2. Plug the bootable USB and boot into it.
3. Follow instructions until login. Then, open a terminal.
4. Install `git` and `make` :
```bash
su -c 'apt install -y git make'
```
5. Clone this repository and cd into it using :
```bash
git clone https://github.com/aloysdev/dotfiles.git && cd dotfiles
```
6. Inspect [`Makefile`](Makefile) and use `make` to install what you need, for example :
```bash
# Basic installation
make install

# NVIDIA drivers
make nvidia

# ...
```
