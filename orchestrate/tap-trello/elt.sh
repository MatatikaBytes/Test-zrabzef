#!/bin/bash

# exit on error
set -e

# run extract-load
meltano run tap-trello "$LOADER"

# install dbt dependencies
meltano invoke dbt deps

# snapshot and run transforms
meltano invoke dbt snapshot --select tap_trello
meltano invoke dbt run -m tap_trello --full-refresh
