#!/usr/bin/env bash

# Source this file when starting the container to set it up
echo "Running setup for environment for ts_LinearStage CSCs to support igusxaxis and igusyaxis containers"
source /home/saluser/.setup_salobj.sh

setup ts_config_atcalsys -t current
setup ts_config_attcs -t current
setup ts_config_eas -t current
setup ts_config_ocs -t current
setup ts_externalscripts -t current
setup ts_idl -t current
setup ts_observatory_control -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_standardscripts -t current
setup ts_xml -t current

echo "Setting up sal, salobj and scriptqueue"

echo "Running custom setups of repos"

setup -j ts_config_mtcalsys -r ~/develop/ts_config_mtcalsys
setup -j ts_LinearStage -r ~/develop/ts_LinearStage

echo 'Installing dependencies and declaring OSPL_URI'
pip install develop/ts_LinearStage/
export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem.xml').as_uri())")

echo "# Launching ts_LinearStage with CSC_INDEX=$CSC_INDEX"
python /home/saluser/develop/ts_LinearStage/bin/run_linearstage ${CSC_INDEX}
/bin/bash --rcfile /home/saluser/.bashrc
