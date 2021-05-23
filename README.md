# Wine dockerized for services
Wine dockerized as a Docker container prepared to run Win32 console application without graphical interfaces e.g. as part or base image of services.

## Good to know and key facts
- Container and Wine is set up as non-root.
- Win32 console applications needs to be built statically.
- First Wine execution inside container will trigger a wineboot (initialization of wine and its local user directories and files). It will take a short moment.
- Wine version is 6.0. Wine is installed from WineHQ repository.
- Wine Gecko and Wine Mono packages are not pre-installed right now.

# Build and run

## Requirements
- bash
- make
- Docker runtime

## Build container image (docker)
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
