#!/usr/bin/env bash

set -e

APP="GBA Bridgehead"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
VALFILE=${DIR}/gba-connector.yml
RELEASE_NAME=gba-connector
CHART=./gba-connector

echo "=== Updating dependencies of ${APP} ==="
helm dependency update gba-connector/
echo "=== Installing ${APP} ==="
echo ""
echo "Choose a database password for Postgres SQL: "
read postgres_passwd
echo ""
echo "Running Helm..."
helm upgrade --install --force -f ${VALFILE} --set postgresql.postgresqlPassword=${postgres_passwd} ${RELEASE_NAME} ${CHART}
echo ""
echo "=== Installing ${APP} Done ==="