#!/usr/bin/bash
source ${HOME}/.setup_sal_env.sh
run_test_csc.py ${RUN_ARG} &
pid="$!"
wait ${pid}
