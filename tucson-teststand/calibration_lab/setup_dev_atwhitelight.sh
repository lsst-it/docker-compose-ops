#!/usr/bin/env bash

# Source this file when starting the container to set it up
echo "Running setup for environment for ts_atwhitelight CSC"
source /home/saluser/.setup_salobj.sh

setup ts_config_atcalsys -t current
setup ts_idl -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_tcpip -t current

echo "Running custom setups of repos"
setup -j ts_config_atcalsys -r ~/develop/ts_config_atcalsys
setup -j ts_atwhitelight -r ~/develop/ts_atwhitelight

# echo 'Installing dependencies and declaring OSPL_URI'
# pip install -e develop/ts_TunableLaser/[dev]
export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem.xml').as_uri())")

echo "# Launching ts_atwhitelight CSC"
python /home/saluser/develop/ts_atwhitelight/bin/run_atwhitelight
# /bin/bash --rcfile /home/saluser/.bashrc
