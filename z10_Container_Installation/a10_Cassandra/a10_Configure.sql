
docker pull cassandra

docker images

mkdir -p /Users/raj/lib/cassandra/data
mkdir -p /Users/raj/lib/container_data/cassandra-node-1


-- Run

docker run --name cassandra-node-01 -d \
-e CASSANDRA_CLUSTER_NAME="docker_test" \
-e CASSANDRA_NUM_TOKENS="8" \
-e CASSANDRA_DC="dc1" \
-e CASSANDRA_RACK="rack1" \
-e CASSANDRA_ENDPOINT_SNITCH="GossipingPropertyFileSnitch" \
-v /Users/raj/lib/container_data/cassandra-node-1:/Users/raj/lib/cassandra/data \
-p 0.0.0.0:9042:9042 \
cassandra:latest

-- Attach the container

docker exec -it cassandra-node-01  bash
# Connect to the container
cqlsh

-- Check all the nodes in the cluster (Datacenter)

nodetool status

Datacenter: dc1
===============
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address     Load       Tokens       Owns (effective)  Host ID                               Rack
UN  172.17.0.2  65.45 KiB  8            100.0%            f5a8edc0-0bee-49bb-8534-1aabd6a88c0a  rack1

-- Check log

docker logs cassandra-node=01

-- Expose port so that we can connect to the container from outside tool

docker run -p 0.0.0.0:9042:9042 -d cassandra:latest

-- Reference

https://hub.docker.com/_/cassandra





