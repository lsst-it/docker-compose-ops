#!/usr/bin/env bash

# Source this file when starting the container to set it up
echo "Running setup for environment for ts_CBP CSC"
source /home/saluser/.setup_salobj.sh

setup ts_config_mtcalsys -t current
setup ts_idl -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_tcpip -t current

echo "Running custom setups of repos"
setup -j ts_config_mtcalsys -r ~/develop/ts_config_mtcalsys
setup -j ts_cbp -r ~/develop/ts_CBP
setup -j ts_simactuators -r ~/develop/ts_simactuators

echo "# Launching ts_CBP CSC"
python /home/saluser/develop/ts_CBP/bin/run_cbp
# /bin/bash --rcfile /home/saluser/.bashrc
