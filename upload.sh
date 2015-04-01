#!/bin/sh

TARGET=$1

case "$TARGET" in
  live )
    DEST=/srv/trigger-live
    ;;
  stage )
    DEST=/srv/trigger-stage
    ;;
  * )
    echo "You must specify live or stage."
    exit
    ;;
esac

find . -name .DS_Store -delete

gcloud compute ssh ubuntu@triggerrally-europe-0  --command "cd $DEST;rm -rf *" --zone europe-west1-b
gcloud compute copy-files server ubuntu@triggerrally-europe-0:$DEST --zone europe-west1-b
