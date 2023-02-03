#!/usr/bin/env bash

# Source this file when starting the container to set it up
echo "Running setup for environment for FiberSpectrograph"
source /home/saluser/.setup_salobj.sh

setup ts_config_ocs -t current
setup ts_idl -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_xml -t current

echo "# Running custom setups of repos"
setup -j ts_config_ocs -r ~/develop/ts_config_ocs
setup -j ts_fiberspectrograph -r ~/develop/ts_FiberSpectrograph
setup -j ts_utils -r ~/develop/ts_utils

echo '# Installing dependencies and declaring OSPL_URI'
export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem.xml').as_uri())")
echo 'Setting up LFA'
export S3_ENDPOINT_URL=https://s3.cp.lsst.org

echo "# Launching FiberSpectrograph with CSC_INDEX=$CSC_INDEX"
python /home/saluser/develop/ts_FiberSpectrograph/bin/run_fiberspectrograph ${CSC_INDEX}
#/bin/bash --rcfile /home/saluser/.bashrc
