# Description
- Alpine 3.4
- Consul Template

# Build
```
docker build -t macadmin/consul-template:0.15.0 .
```

# Consul Template

export ZOO_SERVERS=1:srv1:2888:3888,2:srv2:2888:3888,3:srv3:2888:3888

consul-template -consul=localhost:8500 -template "zoo.ctmpl:zoo.cfg" -dry -once
