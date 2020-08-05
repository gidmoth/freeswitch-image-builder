# freeswitch-image-builder

Builds an OCI-Image with freeswitch 1.10 without video-support inspired by [this
README](https://github.com/signalwire/freeswitch/tree/master/docker/base_image).
This is a work in progress and not done yet, please use with care. The next
step is to compile freeswitch instead of installing it from debian-packeges, to
get rid of the video-deps and the video-parts of freeswitch.

This script is only tested on a default-Install of [fedora
silverblue 32](https://silverblue.fedoraproject.org/). But it should work on
any machine with [docker](https://www.docker.com/) installed and the
[dockerhub](https://hub.docker.com/) available as an image source. You should
only need to replace all occurences of `podman` with `docker`.

There is not much fancy stuff in here, you could also just look at the script
and take it as a cheatsheet of what to do to get a freeswitch-container.
