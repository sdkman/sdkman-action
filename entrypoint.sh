#!/bin/bash

if [ -z "$1" ]; then
  echo "Must provide candidate"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Must provide version"
  exit 1
fi

function __sdkman_echo_debug() {
	if [[ "$sdkman_debug_mode" == 'true' ]]; then
		echo "$1"
	fi
}

function __sdkman_echo() {
	if [[ "$sdkman_colour_enable" == 'false' ]]; then
		echo -e "$2"
	else
		echo -e "\033[1;$1$2\033[0m"
	fi
}

function __sdkman_echo_green() {
	__sdkman_echo "32m" "$1"
}

base_name="$1-$2"

binary_input=${base_name}.bin
zip_output=${base_name}.zip

post_installation_hook=hook_post_${candidate}_${version}.sh
if [ -z "$3" ]; then
  curl -L -o $base_name.bin  https://api.sdkman.io/2/broker/download/$1/$2
  curl https://api.sdkman.io/2/hooks/post/$1/$2 >| "$post_installation_hook"
else
  curl -L -o $base_name.bin  https://api.sdkman.io/2/broker/download/$1/$2/$3
  ls
  curl https://api.sdkman.io/2/hooks/post/$1/$2/$3 >| "$post_installation_hook"
fi

source $post_installation_hook
__sdkman_post_installation_hook

ls /tmp

file="${base_name}.zip"
echo "::set-output name=file::$file"
