FROM centos:7

LABEL description="Kafka 1.0.1 - 2.11. \
To override properties add \"--override $key=$value\" in CMD \
- KUCHEEV A.P. \
"

RUN yum install -y java-1.8.0-openjdk && \
yum clean all && \
rm -rf /var/cache/yum

ADD ./files /

RUN tar -xf /kafka_2.11-1.0.1.tgz && \
rm -rf /kafka_2.11-1.0.1.tgz; \
chmod +x /entrypoint.sh


ENV KAFKA_DIR="/kafka_2.11-1.0.1"
ENV BROKER_ID=0
ENV LISTENERS="PLAINTEXT://:9092"
ENV ADVERTIZED_LISTENERS="PLAINTEXT://localhost:9092"
ENV NUM_NETWORK_THREADS=3
ENV NUM_IO_THREADS=8
ENV LOG_DIRS="/tmp/kafka-logs"
ENV ZOOKEEPER_CONNECT="localhost:2181"
ENV JMX_PORT=8993
ENV KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote=true \
     -Dcom.sun.management.jmxremote.authenticate=false  \
     -Dcom.sun.management.jmxremote.ssl=false \
     -Djava.rmi.server.hostname=localhost"


ENTRYPOINT ["/entrypoint.sh"]