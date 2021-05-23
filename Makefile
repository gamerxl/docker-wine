SHELL := /bin/bash

# Default
all: up

# Build container.
build:
	docker build -t gamerxl/wine .

# Build container for tests.
.build-test: build
	docker build -f test/Dockerfile -t gamerxl/wine:test .

# Test container.
check: .build-test
	docker run -t --rm -v "$(PWD)/test:/test" gamerxl/wine:test

# Run container.
run:
	docker run -t -i --rm -e WINEDEBUG=-all gamerxl/wine bash

# Build and run container.
up: build run

# Stop and remove running container.
stop:
	docker stop gamerxl/wine; docker rm gamerxl/wine

# Tagging container for publishing.
# tag:
# 	docker tag gamerxl/wine <remote-tag>

# Publish container.
# publish:
# 	docker push <remote-tag>
