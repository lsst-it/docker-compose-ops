#!/usr/bin/env bash

source $HOME/.setup_sal_env.sh

(ospl start >>/tmp/messages 2>&1 && \
sleep 2 && \
chmod a+rw $(ls -t /tmp/spdds* | head -n 1) && \
echo "# - ospl daemon ready" ) && \
/bin/bash --rcfile /home/saluser/.bashrc || \
(echo "# - failed to setup daemon" && exit 1)
