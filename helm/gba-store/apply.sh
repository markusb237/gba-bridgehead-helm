#!/usr/bin/env bash

set -e

APP="GBA Bridgehead"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
VALFILE=${DIR}/gba-store.yml
RELEASE_NAME=gba-store
CHART=./gba-store

echo "=== Updating dependencies of ${APP} ==="
helm dependency update gba-store/
echo "=== Installing ${APP} ==="
echo ""
echo "Choose a database password for Postgres SQL: "
read postgres_passwd
echo ""
echo "Running Helm..."
helm upgrade --install --force -f ${VALFILE} --set postgresql.postgresqlPassword=${postgres_passwd} ${RELEASE_NAME} ${CHART}
echo ""
echo "=== Installing ${APP} Done ==="