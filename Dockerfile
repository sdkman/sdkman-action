FROM alpine:3.12

ENV SDKMAN_DIR=/usr/home/.sdkman

RUN apk --no-cache add curl bash zip unzip

RUN curl -s "https://get.sdkman.io" | bash

RUN bash -c "source /usr/home/.sdkman/bin/sdkman-init.sh && sdk version"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
