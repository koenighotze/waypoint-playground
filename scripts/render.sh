#!/usr/bin/env bash

set -eu

export DOCKER_REGISTRY=${DOCKER_REGISTRY:-koenighotze}
export NAMESPACE=${NAMESPACE:-test-namespace}

if [[ -e "waypoint.hcl" ]]; then
  echo "Waypoint configuration file exists. Moving to waypoint.hcl.backup.$$"
  mv waypoint.hcl waypoint.hcl.backup.$$
fi

echo Rendering Waypoint configuration
envsubst < waypoint.template.hcl > waypoint.hcl