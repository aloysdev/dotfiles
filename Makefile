.PHONY: install gnome dev

install:
	sudo apt update
	sudo apt upgrade -y
	xargs -a packages/base.list sudo apt install -y
	sudo apt autoremove -y

gnome:
	xargs -a packages/gnome.list sudo apt install -y

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
	gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true

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
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'
	gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue'
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark

	# Keybindings settings
	gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
	gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier 'disabled'

	gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>i']"

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

	# Extensions
	gnome-extensions disable ubuntu-dock@ubuntu.com
	gnome-extensions disable ding@rastersoft.com

dev:
	git remote set-url origin git@github.com:aloysdev/dotfiles.git
	bash symlink.sh config/git
	bash symlink.sh config/ssh
	bash symlink.sh config/vscode