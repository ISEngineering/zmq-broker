check process zss_broker
  with pidfile /var/ise_service/zmq-broker/tmp/service.pid
  start program = "/bin/bash -c '/etc/init.d/zss-broker start'"
  stop program = "/bin/bash -c '/etc/init.d/zss-broker stop'"
