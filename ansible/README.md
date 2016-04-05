# Description

- Ubuntu 14.04
- with ansible

[Docker Hub](https://hub.docker.com/r/macadmin/ansible/)

# Build

```
docker build -t macadmin/ansible .
```

# Strip image

## First run it so that you have a container to refer to:

```
docker run --rm -i -t macadmin/ansible bash -l
```

## Then export it and re-import it:

```
docker export `docker ps -q -n=1` | docker import - private.repo/ansible
```

### Verify that the new image only has one layer with:

```
docker history private.repo/ansible
```
