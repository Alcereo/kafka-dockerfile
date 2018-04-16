#!/bin/bash

# rm kafka-1-0-1.tar

docker build -t alcereo/kafka:1.0.1 .

# docker save alcereo/kafka:1.0.1 -o kafka-1-0-1.tar

# docker run -it alcereo/kafka:1.0.1

# docker run -d \
# --net host \
# --name kafka \
# alcereo/kafka:1.0.1