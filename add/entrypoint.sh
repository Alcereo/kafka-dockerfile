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
--override kafka.influxdb.metrics.reporter.enabled=$KAFKA_INFLUXDB_METRICS_REPORTER_ENABLED
--override kafka.influxdb.metrics.address=$KAFKA_INFLUXDB_METRICS_ADDRESS
--override kafka.influxdb.metrics.database=$KAFKA_INFLUXDB_METRICS_DATABASE
--override kafka.influxdb.metrics.username=$KAFKA_INFLUXDB_METRICS_USERNAME
--override kafka.influxdb.metrics.password=$KAFKA_INFLUXDB_METRICS_PASSWORD
"

if [ "$KAFKA_INFLUXDB_METRICS_REPORTER_ENABLED" = "true" ];
then
OVERRIDES="${OVERRIDES}
--override kafka.metrics.reporters=com.github.fhuss.kafka.influxdb.KafkaInfluxMetricsReporter
"
fi

exec $KAFKA_SCRIPT $KAFKA_CONFIG $OVERRIDES $@