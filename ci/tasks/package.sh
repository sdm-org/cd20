#!/bin/bash

set -e -u -x

cd source-code/
  ./mvnw clean package
cd ..

mkdir build-output
cp source-code/target/cd20-0.1.0-SNAPSHOT.jar  build-output/.