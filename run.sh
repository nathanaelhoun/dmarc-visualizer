#!/bin/sh

set -eux

docker compose up --detach

xdg-open "http://localhost:3000/d/SDksirRWz-new/dmarc-reports"

docker compose logs --follow parsedmarc
