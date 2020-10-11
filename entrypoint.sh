#!/bin/bash

bash -c "source /opt/.sdkman/bin/sdkman-init.sh && sdk install $1 $2"
bash -c "mkdir -p /github/workspace/.sdkman/archives/"
bash -c "cp -r /opt/.sdkman/archives /github/workspace/.sdkman/"
