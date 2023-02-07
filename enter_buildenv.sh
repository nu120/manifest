#!/bin/bash

IMAGE=ghcr.io/nu120/buildroot
WORKDIR=/opt/buildroot

update() {
	echo -e "\e[7mUpdate the docker image to latest\e[0m"
	docker pull $IMAGE
}

start() {
	echo -e "\e[7mStart docker container without ccache\e[0m"
	docker run -it --rm \
		-v $PWD:$WORKDIR \
		-w $WORKDIR \
		$IMAGE
}

start_with_ccache() {
	echo -e "\e[7mStart docker container with ccache\e[0m"
	docker run -it --rm \
		-v $PWD:$WORKDIR \
		-v $HOME/cache/dl:$WORKDIR/buildroot/dl \
		-v $HOME/cache/ccache:/root/.buildroot-ccache  \
		-w $WORKDIR \
		$IMAGE
}

update
if [ -d $HOME/cache ]; then
	start_with_ccache
else
	start
fi

