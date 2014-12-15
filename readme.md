# AwaNoodle/Influx #

A Vagrant file to create a machine that hosts InfluxDB and Graphana. It makes use of a [boot2docker base box](https://atlas.hashicorp.com/yungsang/boxes/boot2docker "base box") to offer a similar environment to using boot2docker directly.

## Pre-Requisites ##

- [https://www.vagrantup.com/](https://www.vagrantup.com/ "Vagrant") - download the Vagrant runtime from here
- [https://www.virtualbox.org/](https://www.virtualbox.org/ "VirtualBox") - This should work with other Vagrant providers but it's only been tested with VirtualBox

## Creating the Machine ##

Clone the repository and navigate to the folder on the command line. To start the machine just type

    Vagrant Up

After the script has finished you can check the status of the containers with

	Vagrant ssh

Which should bring up the SSH terminal for the machine. Then type

	docker ps

which should show two containers: **influxdb** and **graphana**. If you can see these, the containers are running.

## Using ##



## To Do ##
- Fix IP address for Graphana configuration
- Protect against a second provision. Containers may be running and should be shut down
- Config vars for the passwords etc