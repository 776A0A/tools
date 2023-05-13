#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <script_url1> [<script_url2> ...]"
  exit 1
fi

for url in "$@"; do
  curl -sSL $url | bash
done
