#!/usr/bin/env bash

LATEST_TAG=geosysx/geostack
VERSION=0.1

docker build -t $LATEST_TAG -t $LATEST_TAG:$VERSION .
