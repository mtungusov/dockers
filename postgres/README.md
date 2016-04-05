# Run client

POSTGRES_PASSWORD: "g4YsXXuLRcyfRVMP4Y"


```
docker run -it --link db:postgres --rm postgres sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
```
