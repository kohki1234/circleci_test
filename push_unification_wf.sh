#!/usr/bin/env bash

CURRENT_BRANCH=`git rev-parse --abbrev-ref @`

if [ $CURRENT_BRANCH = "main" ]; then
  cd test_folder
  digdag check
  digdag push circleci_test \
  -e https://api-workflow.treasuredata.com \
  -X client.http.headers.authorization="TD1 $TD_API_KEY" \
  -r `date -u +"%Y-%m-%dT%H:%M:%SZ"`-`git rev-parse HEAD`
fi