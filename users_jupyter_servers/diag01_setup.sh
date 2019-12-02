#!/usr/bin/env bash

# Source this file when starting the container to set it up

. ~/.bash_profile
echo "#"
echo "# Loading sal environment"
. repos/ts_sal/setup.env
echo "#"
echo "# Loading LSST Stack"
. /opt/lsst/software/stack/loadLSST.bash
setup lsst_distrib
echo "#"
echo "# Setting up sal, salobj and scriptqueue"

echo "# Setting up cwfs"
cd ~/develop/cwfs/
eups declare cwfs -r . -t $USER
setup cwfs -t $USER

cd ~/

setup ts_xml -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_scriptqueue -t current

echo "#"
echo "# Starting jupyter lab server"

jupyter lab --ip 139.229.170.201 --port 8885 --no-browser
