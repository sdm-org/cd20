#!/bin/bash

set -e -u -x

cd source-code/
./mvnw package

cp source-code/target/cd20-0.1.0-SNAPSHOT.jar  build-output/.