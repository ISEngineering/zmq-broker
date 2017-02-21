check process zss_broker
  with pidfile /mnt/hdd2/deploy/zmq-broker/tmp/service.pid
  start program = "/bin/bash -c '/etc/init.d/zss-broker start'"
  stop program = "/bin/bash -c '/etc/init.d/zss-broker stop'"
