#!/usr/bin/env bash

# Source this file when starting the container to set it up
echo "Running setup for environment for ts_TunableLaser CSC"
source /home/saluser/.setup_salobj.sh

setup ts_config_mtcalsys -t current
setup ts_idl -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_tcpip -t current

echo "Setting up sal, salobj and scriptqueue"

echo "Running custom setups of repos"

setup -j ts_config_mtcalsys -r ~/develop/ts_config_mtcalsys

echo 'Installing dependencies'
pip install -e develop/ts_TunableLaser/

echo "# Launching ts_TunableLaser CSC"
python /home/saluser/develop/ts_TunableLaser/bin/run_tunablelaser
# /bin/bash --rcfile /home/saluser/.bashrc
