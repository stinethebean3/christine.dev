.DEFAULT_GOAL := all

.PHONY: all
all: image modules build 

.PHONY: image
image:
	docker build -t resume-cli .

.PHONY: modules
modules:
	docker run --entrypoint /usr/bin/npm --volume $(PWD):/data -t resume-cli install

.PHONY: build
build:
	docker run --volume $(PWD):/data -t resume-cli export --resume resume.yaml resume.html

.PHONY: shell
shell:
	docker run --entrypoint /bin/sh --volume $(PWD):/data -it resume-cli

.PHONY: publish
publish:
	cp resume.html ~/Public/christine.dev/index.html


