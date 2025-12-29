#!/bin/bash

mkdir -p ~/.nano/
if [ ${?} -ne 0 ]; then exit 1; fi

cp -v planet.nanorc ~/.nano/
if [ ${?} -ne 0 ]; then exit 1; fi

echo "include ~/.nano/planet.nanorc" >> ~/.nanorc
if [ ${?} -ne 0 ]; then exit 1; fi

cat ~/.nanorc
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
