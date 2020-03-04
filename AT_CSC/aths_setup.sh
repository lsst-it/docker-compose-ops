
source ~/miniconda3/bin/activate
source $OSPL_HOME/release.com

source /home/saluser/.bashrc

source $CONDA_PREFIX/HeaderService/setpath.sh $CONDA_PREFIX/HeaderService

echo "# Starting ATHeaderService CSC"

ATHS_salobj -c $HEADERSERVICE_DIR/etc/conf/atTelemetry.yaml --send_efd_message

echo "# ATHeaderService exited."
