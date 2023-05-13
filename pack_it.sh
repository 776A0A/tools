#!/bin/bash

if ! command -v zip >/dev/null; then
  echo "\033[33mZip tool is not installed.\033[0m"
  read -p "Do you want to install it? (y/n) " choice
  case "$choice" in
  y | Y)
    echo "Installing zip tool..."
    yum install -y zip
    ;;
  n | N)
    echo "Exiting script."
    exit 1
    ;;
  *)
    echo "Invalid choice. Exiting script."
    exit 1
    ;;
  esac
fi

if [ ! -d "packed" ]; then
  mkdir "packed"
fi

if [ $# -eq 0 ]; then
  echo "Usage: pack_it.sh <file/dir> [name]"
  exit 1
fi

if [ $# -eq 1 ]; then
  name=$(basename "$1")
else
  name="$2"
fi

if [ -d "$1" ]; then
  zip -r "packed/$name.zip" "$1"
else
  zip "packed/$name.zip" "$1"
fi

if [ $? -eq 0 ]; then
  echo -e "\033[32mFile compressed to packed/$name.zip\033[0m"
else
  echo -e "\033[31mCompression failed.\033[0m"
fi

exit 0
