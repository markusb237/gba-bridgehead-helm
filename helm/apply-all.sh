#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "====== Apply Helm Scripts ======"
echo ""
echo "You will be asked some questions."
echo "Update helm repos..."
echo ""
helm repo update
echo ""
echo "Running all available helm apply scripts..."
echo ""
for f in ${DIR}/**/apply.sh; do
  echo ""
  echo ""
  bash "$f"
  echo ""
  echo ""
done

echo "====== Done with all scripts ======"