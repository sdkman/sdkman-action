#!/bin/bash

if [ -z "$1" ]; then
  echo "Must provide candidate"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Must provide version"
  exit 1
fi

if [ -z "$3" ]; then
  curl -L -o $1-$2.zip  https://api.sdkman.io/2/broker/download/$1/$2
else
  curl -L -o $1-$2.zip  https://api.sdkman.io/2/broker/download/$1/$2/$3
fi

mkdir -p /github/workspace/
cp $1-$2.zip /github/workspace/
file=$1-$2.zip
echo "::set-output name=file::$file"
