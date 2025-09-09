#!/usr/bin/env sh

# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

# The directory where the manuscript is located
MANUSCRIPT_DIR=manuscript

# The directory where the published output files will be created
PUBLISH_DIR=publish

# To override theme configuration file you can pass the following command-line
# arguments:
#
#    -a pdf-themesdir=$PUBLISH_DIR/themes \
#    -a pdf-theme=$1 \
#    -a pdf-fontsdir=$PUBLISH_DIR/fonts \
docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf \
    -D $PUBLISH_DIR $MANUSCRIPT_DIR/index.adoc
