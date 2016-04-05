# Description
- Alpine 3.3
- Consul

# Build
```
docker build -t consul:0.6.3 .
```

# Env
```
RUN_MODE_SERVER=true
EXTERNAL_IP=""
CLIENT_ADDR=""
DATACENTER=""
TOKEN=""
UI_ENABLE=true
```

# Run
## Test
```
docker run --rm -i -t \
-e "RUN_MODE_SERVER=true" \
-e "DATACENTER=dsk3" \
-e "EXTERNAL_IP=192.168.2.89" \
-e "TOKEN=tZUvxcMR7sjHbhAhO5HM3g==" \
-e "UI_ENABLE=true" \
consul:0.6.3 bash -l
```
