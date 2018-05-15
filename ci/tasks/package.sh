#!/bin/bash

set -e -u -x

timestamp=`date "+%Y%m%d%H%M%S"`

cd source-code/
  ./mvnw build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion}-${timestamp} versions:commit
  ./mvnw clean package deploy --settings .settings.xml
  project_version=$(grep -E -m 1 -o "<version>(.*)</version>" pom.xml | sed 's/<version>//' | sed 's/<\/version>//')
cd ..

echo $project_version > build-output/version
cp source-code/target/cd20-${project_version}.jar  build-output/.