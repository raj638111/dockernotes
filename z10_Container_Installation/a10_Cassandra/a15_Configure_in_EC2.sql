
sudo yum update -y
sudo yum install -y docker
sudo service docker start

docker pull cassandra

docker images

mkdir -p /home/ec2-user/lib/cassandra/data
mkdir -p /home/ec2-user/lib/container_data/cassandra-node-1


-- Run

sudo service docker start
// recent container
docker start `docker ps -q -l`


docker run --name cassandra-node-01 -d \
-e CASSANDRA_CLUSTER_NAME="docker_test" \
-e CASSANDRA_NUM_TOKENS="8" \
-e CASSANDRA_DC="dc1" \
-e CASSANDRA_RACK="rack1" \
-e CASSANDRA_ENDPOINT_SNITCH="GossipingPropertyFileSnitch" \
-v /home/ec2-user/lib/container_data/cassandra-node-1:/home/ec2-user/lib/cassandra/data \
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

/home/ec2-user/data/kafka/kafka/log.dirs
/home/ec2-user/data/kafka/zookeeper/dataDir

ssh -i ~/Desktop/access/rajkp.pem ec2-user@ec2-3-80-22-120.compute-1.amazonaws.com

scp -i ~/Desktop/access/rajkp.pem ./ ec2-user@ec2-3-80-22-120.compute-1.amazonaws.com:~/

scp -i ~/Desktop/access/rajkp.pem /Users/raj/ws/tweet-service/service/target/service-0.0.1-SNAPSHOT.jar ec2-user@ec2-3-80-22-120.compute-1.amazonaws.com:~/

scp -i ~/Desktop/access/rajkp.pem

scp -i ~/Desktop/access/rajkp.pem ~/installations/jdk-8u251-linux-i586.rpm ec2-user@ec2-3-80-22-120.compute-1.amazonaws.com:~/

scp -i ~/Desktop/access/rajkp.pem ~/installations/scala-2.13.0.rpm ec2-user@ec2-3-80-22-120.compute-1.amazonaws.com:~/

sudo wget --no-cookies --no-check-certificate --header "Cookie: %3A%2F%2Fwww.oracle.com%2F; -securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz

https://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3a%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"

wget --no-cookies --no-check-certificate "https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"




java -jar ./service-0.0.1-SNAPSHOT.jar
scala -classpath ./hashtag_trends-assembly-0.1.0-SNAPSHOT.jar com.charter.trends.Trends --input tweets --output trends





