#!/bin/bash

echo "#"
echo "# Loading LSST Stack"
source /opt/lsst/software/stack/loadLSST.bash
setup lsst_distrib
echo "#"
echo "# Loading sal environment"
source repos/ts_sal/setup.env
echo "#"
echo "# Setting up sal, salobj and scriptqueue"

setup ts_xml -t current
setup ts_sal -t current

CSC=$1	# CSC name
DBTYPE=$2	# influxwriter, efdwriter, kafkawriter

echo $LSST_EFD_HOST
echo $LSST_DDS_DOMAIN

export LSST_EFD_HOST

./repos/ts_sal/test/${CSC}/cpp/src/sacpp_${CSC}_command_${DBTYPE} &> /dev/null &
./repos/ts_sal/test/${CSC}/cpp/src/sacpp_${CSC}_event_${DBTYPE} &> /dev/null &
./repos/ts_sal/test/${CSC}/cpp/src/sacpp_${CSC}_telemetry_${DBTYPE} &> /dev/null
