#!/bin/bash
set -uo pipefail
set +e

FAILURE=false

echo "safety"
safety check -r requirements.txt || FAILURE=true

echo "shellcheck"
shellcheck tasks/*.sh || FAILURE=true

if [ "$FAILURE" = true ]; then
  echo "Linting failed"
  exit 1
fi
echo "Linting passed"
exit 0