#!/bin/sh
# Download so it can be used offline

{
cd "$1" || exit 5
curl https://remarkjs.com/downloads/remark-latest.min.js -s -o remark-latest.min.js
curl https://ajax.googleapis.com/ajax/libs/jquery/3.5.0/jquery.min.js -s -o jquery.min.js
}
