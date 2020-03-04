#!/usr/bin/env bash

# Source this file when starting the container to set it up

echo "#"
echo "# Loading LSST Stack"
. /opt/lsst/software/stack/loadLSST.bash
setup lsst_distrib
echo "#"
echo "# Loading sal environment"
. /home/saluser/repos/ts_sal/setup.env
echo "#"
echo "# Setting ATDome Simulator"

cd ~/repos/ts_config_attcs/
git fetch --all
git checkout "tags/v0.2.0" -b "v0.2.0"
cd

setup ts_ATDome -t current

run_atdome.py
