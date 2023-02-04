SHELL=/bin/bash
DOCKER_IMAGE_NAME=pi-cross-compile

build-image:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:64 \
		-f docker/Dockerfile.pi-64

build-image-32:
	docker build . \
		-t ${DOCKER_IMAGE_NAME}:32 \
		-f docker/Dockerfile.pi-32

run: build-image
	[ -d mount ] || mkdir mount
	rm -rf mount/*
	docker run -it --rm \
		-v ${PWD}/mount:/mount \
		${DOCKER_IMAGE_NAME}:64

run-32: build-image-32
	[ -d mount ] || mkdir mount
	rm -rf mount/*
	docker run -it --rm \
		-v ${PWD}/mount:/mount \
		${DOCKER_IMAGE_NAME}:32
