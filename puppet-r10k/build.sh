#!/bin/bash
#
# builds the puppet-r10k container
# runs as a jenkins job

# function to get lastest version
get_latest_release() {
  curl --silent "https://api.github.com/repos/actions/runner/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' | sed s/^v//                                   # Pluck JSON value
}

# vars
STR="ARG RUNNER_VERSION="
FILE='Dockerfile'

# get latest vars
ver=$(get_latest_release)

if [ -z "$ver" ] ; then
   echo "blank version detected - skipping update"
   exit
fi

if [[ $ver =~ ^[\)] ]]; then
   echo "bad version detected - skipping update"
   exit
fi

if ! [[ "$ver" =~ ^[0-9] ]] ; then
   echo "bad version detected - skipping update"
   exit
fi

sed -i "s|${STR}.*|ARG RUNNER_VERSION=${ver}|" ${FILE}
docker build . -t zreg.tzoci.site/puppet-r10k
docker push zreg.tzoci.site/puppet-r10k
