#!/bin/sh

export PS4='\n\[\e[36m\]+ \[\e[m\]'
set -o errexit -o nounset -o xtrace

docker compose up --detach
 trap "docker compose down" EXIT

docker compose logs --follow parsedmarc

# Tous les rapports ont été consommés, on ouvre Grafana
xdg-open "http://localhost:3000/d/SDksirRWz-new/dmarc-reports?from=$(cat .last-run-date)T00:00:00.000Z"

date --iso-8601=date > .last-run-date

# Laisser le script tourner tant qu’on ne l’arrête pas manuellement
read -r -d '' _ </dev/tty
