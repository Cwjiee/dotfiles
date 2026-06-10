#!/bin/bash

# Authenticate to retrieve the session token
# (Note: --ignore-stdin is used to avoid issues when running xhs in a script context where stdin is redirected)
session_token=$(xhs --ignore-stdin post hacktrackmmu.herokuapp.com/api/v1/public/authenticate password="hacking things together" | jq -r '.session_token')

# Check if we got a valid token
if [ -z "$session_token" ] || [ "$session_token" = "null" ]; then
  echo "Error: Failed to retrieve session token." >&2
  exit 1
fi

# Activate using the retrieved session token
xhs --ignore-stdin post hacktrackmmu.herokuapp.com/api/v1/public/activate name=hesham "Authorization:Bearer $session_token"
