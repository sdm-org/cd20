#!/bin/bash

set -e -u -x

timestamp=`date "+%Y%m%d-%H%M%S"`

cd source-code/
  ./mvnw build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion}-\${timestamp} versions:commit
  project_version=$(./mvnw help:evaluate -Dexpression=project.version | grep -v "^\[")
  echo version is $project_version
  ./mvnw clean package deploy --settings .settings.xml
cd ..

echo project_version > build-output/version
cp source-code/target/cd20-0.1.0-SNAPSHOT.jar  build-output/.