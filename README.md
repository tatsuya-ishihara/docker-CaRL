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
$ ./tools/setup-CaRL.sh
```

## How to test docker container
1. Run following command to launch CARLA
```
$ docker exec -it (container ID) bash
$ cd CaRL/carla
$ ./CarlaUE4.sh
```

2. Run following command to test
```
$ docker exec -it (container ID) bash
$ ./tools/test-CaRL.sh
```