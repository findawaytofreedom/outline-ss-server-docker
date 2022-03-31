SERVICE := outline-ss-server
REGISTRY := docker.io/findawaytofreedom
# 
VERSION = $(shell git rev-parse --short HEAD)
TAG := ${REGISTRY}/${SERVICE}

echo:
	@echo "Tag:" ${TAG}

pull:
	git pull

build:
	docker buildx build --platform=linux/amd64 --push -t ${TAG}:${VERSION} -t ${TAG}:latest .
	docker image prune -f

push:
	docker push ${TAG}:latest 