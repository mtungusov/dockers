# Description
- Alpine 3.3
- with Redis 3.0.7

# Build
```
docker build -t redis:3.0.7 .
```

## Test Run
```
docker run --rm -i -t -u "$(id -u):$(id -g)" -p 6379:6379 \
private.repo/redis:3.0.6
```
