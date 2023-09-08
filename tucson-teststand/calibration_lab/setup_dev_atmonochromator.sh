#!/usr/bin/env bash

# Source this file when starting the container to set it up

echo "Setting up develop-env container for the atmonochromator"
source /home/saluser/.setup_salobj.sh

setup ts_idl -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_xml -t current

echo "# Running custom setups of repos"

setup -j ts_config_atcalsys -r ~/develop/ts_config_atcalsys
setup -j ts_config_ocs -r ~/develop/ts_config_ocs
setup -j ts_atmonochromator -r ~/develop/ts_atmonochromator

echo "# Launching atmonochromator CSC"
python /home/saluser/develop/ts_atmonochromator/bin/atmonochromator_csc.py
#/bin/bash --rcfile /home/saluser/.bashrc
