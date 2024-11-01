pwd := $(shell pwd)

.PHONY: install nvidia

install:
	su -c 'bash symlink.sh $(pwd)/config/apt/sources.list /etc/apt/sources.list \
		&& bash symlink.sh $(pwd)/config/apt/sources.list.d/* /etc/apt/sources.list.d/'
	    && apt update \
		&& apt upgrade -y \
		&& xargs -a packages/base.list apt install -y \
		&& apt autoremove'

nvidia:
	su -c 'xargs -a packages/nvidia.list apt install -y' 