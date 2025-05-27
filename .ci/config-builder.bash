#!/bin/bash -ev

JPATH='data.sections.volunteer.items'
JPATH='volunteer'
BUILT_YAML="$(jq -rc --arg jpath $JPATH '.data.sections[$jpath]?.items | [map(select(.visible == true))[] | {layout: "left", title: .position, subtitle: .organization, link: .url.href, link_text: .url.label, caption: .date, quote: .summary}]' resume.json | yq -p=json -o=yaml | sed -e 's/^/      /')"

echo "$BUILT_YAML"

VARIABLE_NAME='VOLUNTEERISM'
sed -i -e "s#\$${VARIABLE_NAME}#\\n${BUILT_YAML//$'\n'/\\n}#" ./_config.yml

cat ./_config.yml