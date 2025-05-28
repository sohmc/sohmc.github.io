#!/bin/bash -ev

SECTION=$1
BUILT_YAML="$(jq -rc -f .ci/jq-filters/$SECTION resume.json | yq -p=json -o=yaml | sed -e 's/^/      /')"

VARIABLE_NAME=$2
sed -i -e "s#\$${VARIABLE_NAME}#\\n${BUILT_YAML//$'\n'/\\n}#" ./_config.yml

cat ./_config.yml

