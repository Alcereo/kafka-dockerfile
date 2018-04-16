#!/bin/sh

echo "=== Entrypoint for Kafka-broker ==="

KAFKA_SCRIPT="${KAFKA_DIR}/bin/kafka-server-start.sh"
KAFKA_CONFIG="${KAFKA_DIR}/config/server.properties"

OVERRIDES="
--override broker.id=${BROKER_ID}
--override listeners=$LISTENERS
--override advertised.listeners=$ADVERTIZED_LISTENERS
--override num.network.threads=$NUM_NETWORK_THREADS
--override num.io.threads=$NUM_IO_THREADS
--override log.dirs=$LOG_DIRS
--override zookeeper.connect=$ZOOKEEPER_CONNECT
"

echo $(env)

exec $KAFKA_SCRIPT $KAFKA_CONFIG $OVERRIDES $@