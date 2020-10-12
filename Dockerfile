FROM alpine:3.12

RUN apk --no-cache add curl bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
