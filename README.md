> :information_source: This repository is used to store my dotfiles and quick installation scripts for my personal needs. Feel free to check only the configuration files you are interested in (see [config](./config) folder).

---

[**Debain 12 (Bookworm)**](https://www.debian.org/download)


# Installation

1. Create a bootable USB with the ISO file. 
2. Go to the BIOS and disable **Secure Boot**.
3. Plug the bootable USB and boot into it.
4. Follow instructions until login. Then, open a terminal.
5. Install `git` and `make` :
```bash
su -c 'apt install -y git make'
```
6. Clone this repository and cd into it using :
```bash
git clone https://github.com/aloysdev/dotfiles.git && cd dotfiles
```
7. Inspect [`Makefile`](Makefile) and use `make` to install what you need, for example :
```bash
# Basic installation
make install

# GNOME
make gnome

# ...
```