#!/bin/bash -ev

## -- Usage --
## This script uses a prefixed jq filter to build a YAML section for the resume config file.
##
## build-yaml.bash [-s NUMBER] [-t] SECTION_NAME

## DEFAULTS
SPACE_NUM=0
TEXT_ONLY=false
PREFIX_NEWLINE=false

while getopts "f:s:pt" arg; do
  case $arg in
    f)
      JQ_FILE="$OPTARG"
      ;;
    s)
      SPACE_NUM="$OPTARG"
      ;;
    t)
      TEXT_ONLY=true
      ;;
    p)
      PREFIX_NEWLINE=true
      ;;
    ?)
      echo "Usage incorrect"
      exit 1
      ;;
  esac
done

# Section variable is in the last position
if [[ -n "${@:$OPTIND:1}" ]]; then SECTION_VAR=${@:$OPTIND:1}; fi


# If it's text only, then don't parse it through yq
if [ "$TEXT_ONLY" = true ]; then 
  BUILT_YAML="$(jq -rc -f .ci/jq-filters/$JQ_FILE resume.json)"
else
  BUILT_YAML="$(jq -rc -f .ci/jq-filters/$JQ_FILE resume.json | yq -p=json -o=yaml)"
fi

# Add Spaces in front of the yaml if needed
YAML_SPACES=""
if [[ $SPACE_NUM -ge 0 ]]; then
  for ((i=1; i<=SPACE_NUM; i++)); do
    YAML_SPACES="$YAML_SPACES "
  done

  BUILT_YAML="$(echo "$BUILT_YAML" | sed -e "s/^/$YAML_SPACES/")"
fi

if [ "$PREFIX_NEWLINE" = true ]; then
  sed -e "s#\$${SECTION_VAR}#\\n${BUILT_YAML//$'\n'/\\n}#" ./_config.yml
else
  sed -e "s#\$${SECTION_VAR}#${BUILT_YAML//$'\n'/\\n}#" ./_config.yml
fi

# cat ./_config.yml
