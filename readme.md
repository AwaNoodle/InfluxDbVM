# AwaNoodle/InfluxDbVM #

A Vagrant file to create a machine that hosts InfluxDB and Graphana. It makes use of a [boot2docker base box](https://atlas.hashicorp.com/yungsang/boxes/boot2docker "base box") to offer a similar environment to using boot2docker directly.

## Pre-Requisites ##

- [https://www.vagrantup.com/](https://www.vagrantup.com/ "Vagrant") - download the Vagrant runtime from here
- [https://www.virtualbox.org/](https://www.virtualbox.org/ "VirtualBox") - This should work with other Vagrant providers but it's only been tested with VirtualBox


## Creating the Machine ##

Clone this repository and navigate to the folder on the command line. To start the machine just type

    Vagrant Up

After the script has finished you can check the status of the containers with

	Vagrant ssh

Which should bring up the SSH terminal for the machine. Then type

	docker ps

which should show two containers: **influxdb** and **graphana**. If you can see these, the containers are running.


## Using ##

The created machine is fixed to **192.168.50.4**. You can reach each component via:

- [http://192.168.50.4](http://192.168.50.4 "http://192.168.50.4") - Graphana front end
- [http://192.168.50.4:8083](http://192.168.50.4:8083 "http://192.168.50.4:8083") - InfluxDB front end
- [http://192.168.50.4:8086](http://192.168.50.4:8086 "http://192.168.50.4:8086") - InfluxDB API

Both services have fixed credentials:

- Graphana - **admin** / **s0m3p455w0rd**
- InfluxDB - **root** / **root**

You can follow the Influx [guide on sending data to Influx](http://influxdb.com/docs/v0.8/api/reading_and_writing_data.html) to get started with populating Influx. You can run a quick test using Curl:

	curl -X POST -d '[{"name":"foo","columns":["val"],"points":[[23]]}]' 'http://192.168.50.4:8086/db/db1/series?u=root&p=root'

This should create a single data point for the **foo** series. You can verify the data is in Influx by logging into Influx, selecting *Explore Data*  for the **db1** database, and running the query: 

	select * from foo

You should see a single entry with a val of 23.

## Further Help ##

- [InfluxDB Getting Started](http://influxdb.com/docs/v0.8/introduction/getting_started.html "InfluxDB Getting Started")
- [Using Graphana with Influx](http://grafana.org/docs/features/influxdb/ "Using Graphana with InfluxDB")

## To Do ##
- Fix IP address for Graphana configuration
- Protect against a second provision. Containers may be running and should be shut down
- Config vars for the passwords etc