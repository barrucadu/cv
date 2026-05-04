#!/usr/bin/env bash

echo "$SSH_PRIVATE_KEY" > .ssh_private_key
cleanup() {
    rm .ssh_private_key
}
trap cleanup EXIT
chmod 600 .ssh_private_key

set -x

scp -i .ssh_private_key -o StrictHostKeyChecking=no cv.pdf "concourse-deploy-robot@${TARGET}:/persist/srv/http/barrucadu.co.uk/www/cv.pdf"
