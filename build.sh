#!/bin/bash -e

for a in "$@"; do
  for f in $(find "$a" -name Dockerfile); do
    d="${f%/Dockerfile}"
    tag=$(basename "$d")
    if [[ "$tag" = "$d"* ]]; then
      tag=$DEFAULT_TAG
    fi
    repo=${d%/$tag}
    t="rosindustrial/${repo//\//-}:$tag" # replace other slashed with dashes

    echo
    echo "Build image $t"

    if [ "$TRAVIS" ]; then
      while sleep 9m; do echo "Still building $t..."; done &
      b=$!
    fi

    if [ -z "$BUILD_ARGS" ]
    then
      time docker build -q -t "$t" "$d" || ret=$?
    else
      time docker build -q -t "$t" "$d" $BUILD_ARGS || ret=$?
    fi

    [ "$ret" = "" ]

    if [ "$TRAVIS" ]; then
      disown
      kill $b
    fi
  done
done
exit $ret
