.PHONY: install

install:
	su -c 'apt update \
		&& apt upgrade -y \
		&& xargs -a packages/base.list apt install -y \
		&& apt autoremove'