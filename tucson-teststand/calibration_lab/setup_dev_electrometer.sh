#!/usr/bin/env bash

# Source this file when starting the container to set it up
echo "Running setup for environment for ts_electrometer. The index {$CSC_INDEX} is defined in the docker-compose file."
source /home/saluser/.setup_salobj.sh
setup ts_config_atcalsys -t current
setup ts_idl -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_xml -t current
setup ts_tcpip -t current

echo "# Running custom setups of repos"
setup -j ts_electrometer -r ~/develop/ts_electrometer
setup -j ts_config_ocs -r ~/develop/ts_config_ocs
setup -j ts_utils -r ~/develop/ts_utils

echo '# Installing dependencies and declaring OSPL_URI'
pip install pyserial  # conda takes too long
export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem.xml').as_uri())")

echo "# Launching electrometer with CSC_INDEX=$CSC_INDEX"
python /home/saluser/develop/ts_electrometer/bin/run_electrometer ${CSC_INDEX} 
#/bin/bash --rcfile /home/saluser/.bashrc
