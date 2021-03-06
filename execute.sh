#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /caspar_rails_backend/tmp/pids/server.pid
pwd

rails db:migrate
rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"