#!/usr/bin/env sh

# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

# The directory where the manuscript is located
MANUSCRIPT_DIR=manuscript

# The directory where the published output files will be created
PUBLISH_DIR=publish

docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor:1.63 asciidoctor-epub3 \
    -D $PUBLISH_DIR \
    $MANUSCRIPT_DIR/index.adoc
