#!/bin/bash

set -e

DIR_ICI="${1:-$(rospack find industrial_ci)}"
source $DIR_ICI/src/util.sh
source $DIR_ICI/src/docker.sh

DIR_THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HEADER="# DO NOT EDIT!\n# This file  was auto-generated with ./sync.sh at $(LC_ALL=C date)\n"
INJECT_MAINTAINER="/^FROM/a LABEL MAINTAINER \"$(git config --get user.name)\" <$(git config --get user.email)>"

function export_dockerfile ()(
    echo $*
    ROS_DISTRO=$1
    ROS_REPO=$2
    OS_CODE_NAME=$3
    DOCKER_BASE_IMAGE=$4

    ROS_REPO=${EOL_REPO:-$2} source $DIR_ICI/src/env.sh
    local path=$DIR_THIS/${ROS_DISTRO}-${5:-$OS_CODE_NAME}${2#ros}
    mkdir -p "$path"

    echo -e "$HEADER" > $path/Dockerfile
    ici_generate_default_dockerfile | sed "$INJECT_MAINTAINER" >> $path/Dockerfile
)

for r in ros ros-shadow-fixed; do
    for d in hydro indigo jade kinetic lunar melodic; do
        export_dockerfile $d $r
    done
    EOL_REPO=final export_dockerfile kinetic $r jessie debian:jessie
    EOL_REPO=final export_dockerfile lunar $r yakkety
    EOL_REPO=final export_dockerfile lunar $r zesty
    export_dockerfile lunar $r stretch debian:stretch
    export_dockerfile melodic $r stretch debian:stretch
    EOL_REPO=final export_dockerfile melodic $r artful
done
