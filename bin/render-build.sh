#!/usr/bin/env bash

# exit on error
set -o errexit

npm run build
bundle install
rails db:truncate_all
rails db:migrate
rails db:seed #if needed