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

echo "# Setting up sal, salobj and scriptqueue"

#setup ts_xml -t current
#setup -j ts_xml -r ~/develop/ts_xml
# sets up ts_xml to work for all environments (meaning make_idl_files.py will see it)
# eups declare -r ~/develop/ts_xml -t $USER
# setup -j ts_xml -r ~/develop/ts_xml
#make_idl_files LinearStage
#setup ts_xml -t $USER
# isn't working, have to manually run `setup -r .` in the ts_xml directory

echo "# Running custom setups of repos"

setup -j ts_config_mtcalsys -r ~/develop/ts_config_mtcalsys
setup -j ts_LinearStage -r ~/develop/ts_LinearStage

echo '#Installing dependencies and declaring OSPL_URI'
pip install develop/ts_LinearStage/.[dev]
export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem.xml').as_uri())")

echo '# now exec into the container to make new xml change, make idl file for the LinearStage, then launch the container"

/bin/bash --rcfile /home/saluser/.bashrc
