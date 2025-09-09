REM Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
REM Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

REM The directory where the manuscript is located
SET MANUSCRIPT_DIR=manuscript

REM The directory where the published output files will be created
SET PUBLISH_DIR=publish

docker run --rm -v "%CD%":/documents/ asciidoctor/docker-asciidoctor asciidoctor-epub3 -D %PUBLISH_DIR% %MANUSCRIPT_DIR%/index.adoc
