# docker-carla_garage

## How to use docker container
1. Run following command
```
$ docker compose build
$ docker compose up -d
```

2. Run following command
```
$ docker exec -it (container ID) bash
$ ./tools/setup-carla_garage.sh
```

## How to test docker container
1. Run following command to launch CARLA
```
$ docker exec -it (container ID) bash
$ cd carla_garage/carla
$ ./CarlaUE4.sh
```

2. Run following command to test
```
$ docker exec -it (container ID) bash
$ ./tools/test-carla_garage.sh
```