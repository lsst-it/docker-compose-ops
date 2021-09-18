#!/bin/bash
source .setup_sal_env.sh
export OSPL_URI=$(python -c "from lsst.ts import ddsconfig; print( (ddsconfig.get_config_dir() / 'ospl-shmem-debug.xml').as_uri())")
export LSST_DDS_ALIGNER=true
export LSST_DDS_ALIGNEE=Initial
export OSPL_MASTER_PRIORITY=200
ospl start
sleep 30
run_salkafka_producer.py --broker $BROKER_IP:$BROKER_PORT \
--registry $REGISTRY_ADDR \
--partitions  $PARTITIONS \
--loglevel $LOG_LEVEL \
--replication-factor $REPLICATION \
--wait-ack $WAIT_ACK \
$CSC_LIST
