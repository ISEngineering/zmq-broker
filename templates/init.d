AS_USER="deploy"
APP_DIR="/mnt/hdd2/deploy/zmq-broker"
PID=`head -1 ${APP_DIR}/tmp/service.pid`
RETVAL=0
ZSS_ENV=production


start() {
  su -c "export NODE_ENV=$ZSS_ENV; cd $APP_DIR && nvm exec bin/zss-broker > $APP_DIR/log/${ZSS_ENV}.log &" - $AS_USER

  RETVAL=1
  return $RETVAL
}

stop() {
  su -c "kill -9 $PID" - $AS_USER

  RETVAL=1
  return $RETVAL
}

restart() {
  su -c "export NODE_ENV=$ZSS_ENV; kill -9 $PID && cd $APP_DIR && nvm exec bin/zss-broker > $APP_DIR/log/${ZSS_ENV}.log &" - $AS_USER

  RETVAL=1
  return $RETVAL
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  *)
    echo "Usage: $0 {restart|start|stop}"
    exit 0
    ;;
esac
exit $RETVAL
