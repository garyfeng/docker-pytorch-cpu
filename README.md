# pytorch-CPU docker
Docker Images with pytorch-CPU

## CPU

```
cd cpu
docker build -t pytorch-cpu-docker:cpu .
docker run -it pytorch-cpu-docker:cpu bash
```

## Pushing to dockerhub

```
docker tag pytorch-cpu-docker:cpu garyfeng/pytorch-cpu:latest
docker push garyfeng/pytorch-cpu:latest
```

Then see https://hub.docker.com/repository/docker/garyfeng/pytorch-cpu/general
