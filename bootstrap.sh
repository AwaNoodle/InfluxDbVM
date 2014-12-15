git clone https://github.com/tutumcloud/tutum-docker-influxdb.git
cd tutum-docker-influxdb
docker build -t tutum/influxdb .
docker run --name influxdb -d -p 8083:8083 -p 8086:8086 -e PRE_CREATE_DB="db1,graphana" tutum/influxdb
cd ..
git clone https://github.com/tutumcloud/tutum-docker-grafana.git
cd tutum-docker-grafana
docker build -t tutum/grafana .
docker run -d -p 80:80 --name graphana_app --link influxdb:idb -e HTTP_USER=admin -e HTTP_PASS=s0m3p455w0rd -e INFLUXDB_HOST=192.168.59.103 -e INFLUXDB_IS_GRAFANADB=true -e INFLUXDB_PORT=8086 -e INFLUXDB_NAME=db1 -e INFLUXDB_USER=root -e INFLUXDB_PASS=root tutum/grafana
