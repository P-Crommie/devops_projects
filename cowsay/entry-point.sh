#!/bin/sh

if [[ -z "$1" ]]; then
    port=8080
else
    port=$1
fi

export PORT=$port 
npm start