FROM alpine

WORKDIR /data
ENTRYPOINT ["resume"]

RUN	apk add --no-cache npm \
	&& npm install -g resume-cli
