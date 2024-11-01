pwd := $(shell pwd)

.PHONY: install nvidia gnome dev

install:
	# Packages
	su -c 'bash symlink.sh $(pwd)/config/apt/sources.list /etc/apt/sources.list \
	    && apt update \
		&& apt upgrade -y \
		&& xargs -a packages/base.list apt install -y \
		&& apt autoremove -y'

	# Bash
	bash symlink.sh $(pwd)/config/bash/.bashrc /home/${USER}/.bashrc
	bash symlink.sh $(pwd)/config/bash/.bash_aliases /home/${USER}/.bash_aliases

nvidia:
	su -c 'xargs -a packages/nvidia.list apt install -y'

gnome:
	# Packages
	su -c 'xargs -a packages/gnome.list apt install -y \
		&& xargs -a packages/gnome.remove.list apt remove --purge -y \
		&& apt autoremove -y'

	# Windows settings
	gsettings set org.gnome.mutter center-new-windows true
	gsettings set org.gnome.mutter edge-tiling false
	gsettings set org.gnome.desktop.interface enable-hot-corners false

	# Power settings
	gsettings set org.gnome.desktop.session idle-delay 0
	gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

	# Multitasking settings
	gsettings set org.gnome.mutter dynamic-workspaces false
	gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
	gsettings set org.gnome.shell.app-switcher current-workspace-only true

	# Search settings
	gsettings set org.gnome.desktop.search-providers sort-order "['org.gnome.Settings.desktop', 'org.gnome.Nautilus.desktop']"

	# Files settings
	gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
	gsettings set org.gnome.nautilus.preferences search-filter-time-type 'last_modified'
	gsettings set org.gnome.desktop.privacy recent-files-max-age 7
	gsettings set org.gnome.desktop.privacy remove-old-trash-files true
	gsettings set org.gnome.desktop.privacy remove-old-temp-files true
	gsettings set org.gnome.desktop.privacy old-files-age 30

	# Theme settings
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark

	# Keybindings settings
	gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
	gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier 'disabled'

	gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>i']"
	gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>m']"
	gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>v']"

	gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Super>Home'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gsettings set org.gnome.desktop.interface color-scheme default'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Prefer light'

	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control><Super>End'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'gsettings set org.gnome.desktop.interface color-scheme prefer-dark'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Prefer dark'

	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Control><Alt>t'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'kgx'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Terminal'

	gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
	gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
	gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
	gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"

	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"

	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"

	gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Control><Super>Up']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Control><Super>Down']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Control><Super>Right']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['<Control><Super>Left']"

	gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print']"

dev:
	# Packages
	su -c 'bash symlink.sh $(pwd)/config/apt/sources.list.d/vscode.list /etc/apt/sources.list.d/vscode.list \
		&& xargs -a packages/dev.list apt install -y'

	# Git
	bash symlink.sh $(pwd)/config/git/.gitconfig /home/${USER}/.gitconfig
	git remote set-url origin git@github.com:aloysdev/dotfiles.git

	# SSH
	bash symlink.sh $(pwd)/config/ssh/config /home/${USER}/.ssh/config

	# Visual Studio Code
	bash symlink.sh $(pwd)/config/vscode/settings.json /home/${USER}/.config/Code/User/settings.json
	bash symlink.sh $(pwd)/config/vscode/keybindings.json /home/${USER}/.config/Code/User/keybindings.json
	code --install-extension mobalic.jetbrains-new-dark --force
	code --install-extension beardedbear.beardedicons --force