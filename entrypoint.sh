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

candidate=$1
version=$2
platform_param=$3

base_name="${candidate}-${version}"

binary_input="/tmp/${base_name}.bin"
zip_output="/tmp/${base_name}.zip"

post_installation_hook=hook_post_${candidate}_${version}.sh
if [ -z "$3" ]; then
  curl -L -o $binary_input  https://api.sdkman.io/2/broker/download/$candidate/$version
  curl https://api.sdkman.io/2/hooks/post/$candidate/$version >| "$post_installation_hook"
else
  curl -L -o $binary_input  https://api.sdkman.io/2/broker/download/$candidate/$version/$platform_param
  curl https://api.sdkman.io/2/hooks/post/$candidate/$version/$platform_param >| "$post_installation_hook"
fi

source $post_installation_hook
__sdkman_post_installation_hook

mkdir -p /github/workspace/
cp $zip_output /github/workspace/

file="${base_name}.zip"
echo "::set-output name=file::$file"
