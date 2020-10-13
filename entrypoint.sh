#!/bin/bash

candidate=$1
version=$2
platform_param=$3

base_name="${candidate}-${version}"

if [ $RUNNER_OS == 'Linux' ] || [ $RUNNER_OS == 'macOS' ]; then
  binary_input="/tmp/${base_name}.bin"
  zip_output="/tmp/${base_name}.zip"

  curl -L -o $binary_input https://api.sdkman.io/2/broker/download/$candidate/$version/$platform_param
  post_installation_hook=hook_post_${candidate}_${version}.sh
  curl -o "$post_installation_hook" https://api.sdkman.io/2/hooks/post/$candidate/$version/$platform_param
  source $post_installation_hook
  __sdkman_post_installation_hook
else
  zip_output="$base_name.zip"
  curl -L -o $zip_output https://api.sdkman.io/2/broker/download/$candidate/$version/$platform_param
fi

echo "::set-output name=file::$zip_output"
