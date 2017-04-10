#!/bin/bash
CMD=$1

cp -r /opt/cloudera/parcels/EAGLE/* $CONF_DIR
mv -f $CONF_DIR/eagle.properties $CONF_DIR/conf

case $CMD in
  (start)
    echo "Starting the web server on port [$WEBSERVER_PORT]"
    cmd="bin/eagle-server.sh start"
    exec ${cmd}
    ;;
  (stop)
    pkill -u tandem -f ServerMain
    ;;
  (*)
    echo "Don't understand [$CMD]"
    exit 1
    ;;
esac
