#! /bin/bash

set -xe

mkdir -p ./rendered

# Map current folder as /src and assume all files passed with -f are relative to this
docker run --rm -v $(pwd):/src:ro -v $(pwd)/rendered:/rendered:rw helm-up --create-namespace --render-to /rendered/out.yaml helmsman $@

# Namespace is missing
cat rendered/out.yaml | envsubst | kubectl apply -f -