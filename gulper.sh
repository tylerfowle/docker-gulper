#!/usr/bin/env bash

if [[ "$1" = /* ]]; then
  file_name="$(basename ${1})"
  dir_name="$(dirname ${1})"
else
  file_name="$1"
  dir_name="$(pwd)"
fi

docker run --rm -p 3000:3000 -it -v $(pwd):/usr/local/src --name gulper gulper
