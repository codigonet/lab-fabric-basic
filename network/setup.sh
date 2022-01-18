#!/bin/bash

curr=$(pwd)

echo "Patching Fabric NODEJS Client"
cd ../client
npm install
rm -f node_modules/fabric-client/lib/packager/BasePackager.js
cp patch/BasePackager.js node_modules/fabric-client/lib/packager/BasePackager.js

echo "Starting Fabric Platform"
cd $curr
docker-compose up -d

echo "Starting Fabric NODEJS Client"
cd ../client
node .
