#!/usr/bin/bash
source ${HOME}/.setup_sal_env.sh
export TS_CONFIG_OCS_DIR=/opt/lsst/software/ts_config_ocs
run_test_csc.py ${RUN_ARG} &
pid="$!"
wait ${pid}
