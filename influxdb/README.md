# Running the container

The InfluxDB image exposes a shared volume under /var/lib/influxdb, so you can mount a host directory to that point to access persisted container data. A typical invocation of the container might be:

```
$ docker run --name=influxdb -p 8086:8086 \
      -v $PWD/share:/var/lib/influxdb \
      influxdb
```      

Modify $PWD to the directory where you want to store data associated with the InfluxDB container.

You can also have Docker control the volume mountpoint by using a named volume.

```
$ docker run -p 8086:8086 \
      -v influxdb:/var/lib/influxdb \
      influxdb
```

# CLI / SHELL
Start the container:

```
$ docker run --name=influxdb -d -p 8086:8086 influxdb
```

Run the influx client in this container:

```
$ docker exec -it influxdb influx
```

Or run the influx client in a separate container:

```
$ docker run --rm --link=influxdb -it influxdb influx -host influxdb
```
