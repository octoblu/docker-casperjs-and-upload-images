FROM zopanix/casperjs
MAINTAINER Octoblu, Inc. <docker@octoblu.com>

ADD https://s3-us-west-2.amazonaws.com/octoblu-upload-image-to-slack/v1.0.0/upload-image-to-slack upload-image-to-slack

COPY ./run.sh run.sh

ENTRYPOINT ["./run.sh"]
CMD ["command.js"]
