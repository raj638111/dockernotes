
docker image rm $(docker image ls -q) -f
docker build



docker run --rm -dit --name t1 topn
docker exec -it t1 /bin/bash


docker run --rm -v /Users/raj/ws/access-log-analytics:/access-log-analytics \
-dit -p 14040:4040 --name mySpark spark-base-image

docker run --rm -v /Users/raj/ws/access-log-analytics:/access-log-analytics \
-dit -p 14040:4040 --name mySpark 9fdb3576ef80

docker run --rm -dit --name c1 rjkumratgmaildotcom/topn
docker exec -it c1 /bin/bash

spark-submit --master local[*] \
--executor-memory 2G --driver-memory 2G \
--conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_LOCAL_DATA_CONNECTION_MODE" \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz \
--partitionCount 8 \
--topN 3 \
--dbNtable demo.test \
--outputPath file:///target/demo/test

docker exec -it mySpark  spark-submit --master local[*] \
--executor-memory 2G --driver-memory 2G \
--conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_LOCAL_DATA_CONNECTION_MODE" \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz \
--partitionCount 8 \
--topN 3 \
--dbNtable demo.test \
--outputPath file:///target/demo/test



docker push new-repo:tagname

docker build -t topn .
docker tag 17b6315ac518 rjkumratgmaildotcom/topn:latest
docker push rjkumratgmaildotcom/topn:latest
docker rmi rjkumratgmaildotcom/topn



sbt 'set test in assembly := {}' clean assembly

docker container stop mySpark
docker container rm mySpark
docker container rm nervous_shirley
docker rm $(docker ps -aq)

-- 2.12

spark-submit --master local[*] \
--executor-memory 2G --driver-memory 2G \
--conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_LOCAL_DATA_CONNECTION_MODE" \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./target/scala-2.12/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz \
--partitionCount 8 \
--topN 3 \
--dbNtable demo.test \
--outputPath file:///Users/raj/ws/access-log-analytics/target/demo/test


rm -rf derby.log metastore_db spark-warehouse
ftp://anonymous:anonpwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz
ftp ita.ee.lbl.gov


530 Sorry, the maximum number of users from your host are already connected.
ftp ita.ee.lbl.gov
Connected to ita.ee.lbl.gov.
220 131.243.2.164 FTP server ready
Name (ita.ee.lbl.gov:root): anonymous
331 Anonymous login ok, send your complete email address as your password
Password:
230 Anonymous access granted, restrictions apply
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> passive
Passive mode on.
ftp> cd traces
250 CWD command successful
ftp> get NASA_access_log_Jul95.gz
local: NASA_access_log_Jul95.gz remote: NASA_access_log_Jul95.gz
227 Entering Passive Mode (131,243,2,164,97,205).
150 Opening BINARY mode data connection for NASA_access_log_Jul95.gz (20676672 bytes)
226 Transfer complete
20676672 bytes received in 25.53 secs (790.9552 kB/s)
ftp> 221 Goodbye.


def getSparkSession(): SparkSession = {
  val ss = SparkSession
    .builder()
    .appName(appName)
    .config("spark.hadoop.hive.exec.dynamic.partition", "true")
    .config("spark.hadoop.hive.exec.dynamic.partition.mode", "nonstrict")
    .enableHiveSupport()
    .getOrCreate()
  log.info("Spark session created")
  ss
}


curl -L -o sbt.deb https://dl.bintray.com/sbt/debian/sbt-1.3.4.deb

wget --no-verbose https://dl.bintray.com/sbt/debian/sbt-1.3.4.deb
dpkg -i sbt-1.3.4.deb
apt-get update
apt-get install sbt

spark-shell --conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_REMOTE_DATA_CONNECTION_MODE"

spark.sparkContext.hadoopConfiguration.set("fs.ftp.data.connection.mode", "PASSIVE_REMOTE_DATA_CONNECTION_MODE")
spark.sparkContext.hadoopConfiguration.get("fs.ftp.data.connection.mode")
spark.sparkContext.textFile("ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz").count

spark.sparkContext.wholeTextFiles("ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz").count

spark-submit --master local[*] \
--executor-memory 2G --driver-memory 2G \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./target/scala-2.12/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:pwd@127.0.0.1:2121/data.gz

/*

spark-submit --master local[*] \
--executor-memory 2G --driver-memory 2G \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./target/scala-2.11/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:anonpwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz

spark-submit --master local[*] \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./target/scala-2.11/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:anonpwd@localhost:2121/data.gz

/spark/bin/spark-submit --master local[*] \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
/user-jars/scala-2.11/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:anonpwd@localhost:2121/data.gz

/spark/bin/spark-submit --master local[*] \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
/user-jars/scala-2.11/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:anonpwd@localhost:2121/data.gz

/spark/bin/spark-submit --master local[*] \
--executor-memory 2G --driver-memory 2G \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
/user-jars/scala-2.11/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:anonpwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz



/spark/bin/spark-submit --master local[*] \
--class org.apache.spark.examples.HdfsTest \
/spark/examples/jars/spark-examples_2.11-2.4.5.jar

 */



 spark-submit --master local[*] \
 --driver-memory 3G \
 --conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_LOCAL_DATA_CONNECTION_MODE" \
 --class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
 ./target/scala-2.12/access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
 --inputPath ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz \
 --partitionCount 8 \
 --topN 3 \
 --dbNtable demo.test \
 --outputPath file:///Users/raj/del/demo/test \
 --invalidTolerance 0 \
 --invalidDataTbl demo.invalid_data



 spark-submit --master local[*] \
 --executor-memory 2G --driver-memory 2G \
 --conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_LOCAL_DATA_CONNECTION_MODE" \
 --class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
 ./access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
 --inputPath ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz \
 --partitionCount 8 \
 --topN 3 \
 --dbNtable demo.test \
 --outputPath file:///target/demo/test \
 --invalidTolerance 10 \
 --invalidDataTbl demo.invalid_data




 spark-submit --master local[*] \
--driver-memory 3G \
--conf spark.hadoop.fs.ftp.data.connection.mode="PASSIVE_LOCAL_DATA_CONNECTION_MODE" \
--class com.secureworks.analytics.accesslog.TopVisitorsNUrl \
./access-log-analytics-assembly-0.1.0-SNAPSHOT.jar \
--inputPath ftp://anonymous:pwd@ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz \
--partitionCount 8 \
--topN 10 \
--dbNtable demo.test \
--outputPath file:///target/demo/test \
--invalidTolerance 10 \
--invalidDataTbl "demo.invalid_data"
