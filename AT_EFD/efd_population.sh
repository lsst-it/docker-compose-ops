#!/bin/bash

cat /opt/lsst/ts_sal/sql/*.sqldef | mysql -u efduser -p'lssttest' -h 192.168.1.2 EFD
