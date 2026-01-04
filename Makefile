.PHONY: build run prune

CONTAINER_TAG ?= bitaichi/debcache
CACHE_DIR ?= ${HOME}/container/.cache/debcache

all: prune build run

build:
	@podman build --tag=${CONTAINER_TAG} .

run:
	@mkdir -p ${CACHE_DIR}
	@podman run --name debcache --init -d --restart=always \
		-p 3142:3142 \
		--volume ${CACHE_DIR}:/var/debcache:z \
		${CONTAINER_TAG}

prune:
	@podman stop debcache
	@podman rm debcache
