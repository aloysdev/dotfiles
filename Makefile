.PHONY: install nvidia

install:
	su -c 'cp packages/sources.list /etc/apt/sources.list && \
		apt update && \
		xargs -a packages/base.list apt install -y && \
		apt autoremove -y'

nvidia:
	su -c 'xargs -a packages/nvidia.list apt install -y'
