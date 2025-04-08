This directory stores the docker-compose configuration for the summit deployment.

The `setup.env` file must be sourced before running any docker-compose commands so that the correct environment is setup. This applies to using all the directories discussed below.

The main summit deployment uses the `support` and `EAS` directories. The `support` directory handles the OSPL daemons. The `EAS` directory handles the WeatherStation.

The `auxtel-vent-gates` directory contains a docker-compose specification for the vent gate / ATDome exhaust 
fan control Raspberry Pi.

The `ESS` directory is currently not used, and contain provisionary deployment descriptors for the ESS Controller docker images for the Raspberry Pi devices at the summit.

The `MT` directory is currently not used, but will be once the CSCs supported there move to the production domain.

The `kafka_writers` directory is meant for supporting CSCs running on domains other than the production one. The `setup_kp.env` script must be sourced before running any docker-compose commands for the Kafka writers.
