#!/bin/bash

# Env (customize to your env)
FS_VERSION="v1.10"
IMAGETAG="1.10"

# get the sources and checkout desired branch
git clone https://github.com/signalwire/freeswitch.git
cd freeswitch && git checkout origin/$FS_VERSION && cd ./..

# build the debian-image to build the freeswitch-image
podman build -t freeswitch-image-builder .

# run the imagebuilder-Image. If using docker the ":Z" will not work, just leave it
# away, it's podman/SELinux specific.
podman run --name fsbuilder -it -v $(pwd)/freeswitch:/freeswitch:Z localhost/freeswitch-image-builder
podman rm fsbuilder
podman image rm localhost/freeswitch-image-builder

# now we have `freeswitch_img.tar.gz` in the build-context
# inside the freeswitch-sources. We just go there and build the
# Image
cd freeswitch/docker/base_image
podman build -t freeswitch:$IMAGETAG .
