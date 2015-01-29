PREFIX = lotreal
NAME ?= ubuntu

IMAGE = ${PREFIX}/${NAME}

BSDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DFDIR = ${BSDIR}/src/${NAME}


.PHONY: build
build:
	cd ${DFDIR}; docker build --tag $(IMAGE) .

.PHONY: pull
pull:
	docker pull $(IMAGE)

.PHONY: push
push:
	docker push $(IMAGE)

.PHONY: test
test:
	docker run --rm -it $(docker_run_flags) $(IMAGE) bash

.PHONY: clean
clean:
	docker rm -f $(NAME)

.PHONY: run
run:
	docker run --detach --name $(NAME) $(docker_run_flags) $(IMAGE)

.PHONY: shell
shell:
	docker exec -it $(NAME) bash

.PHONY: curl
curl:
	curl `docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(NAME)`:9200/_search
