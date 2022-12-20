#!/bin/bash
docker buildx build --platform linux/amd64 -t jmeritt/ombi .
docker push jmeritt/ombi