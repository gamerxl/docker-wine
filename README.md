# Wine dockerized for services
Wine dockerized as a Docker container prepared to run win32 console application without graphical interfaces e.g. as part or base image of services.

## Good to know
- Container and wine is set up as non-root.
- Win32 console applications needs to be built statically.
- First wine execution inside container will trigger a wineboot (initialization of wine and its local user directories and files). It will take a short moment. 

# Build and run

## Requirements
- Docker runtime
- make

## Build docker container image
```bash
make build
```

## Run container (docker)
```bash
make run
```

or build and run in one line:
```bash
make up
```
