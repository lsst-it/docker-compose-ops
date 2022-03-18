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
setup -j ts_idl -r ~/develop/ts_idl

export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem.xml').as_uri())")

echo "Building new idl's due to enumeration change"
make_idl_files.py ATMonochromator

echo "# Launching atmonochromator CSC"
python /home/saluser/develop/ts_atmonochromator/bin/atmonochromator_csc.py
#/bin/bash --rcfile /home/saluser/.bashrc
