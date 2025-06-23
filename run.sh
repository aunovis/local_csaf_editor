#!/bin/bash

port=22002

set -e

if ! command -v node > /dev/null; then
    echo "Error: Please install Node.js."
    exit 1
fi

node_version=$(node --version)
# Extract the major version number (remove the 'v' and get the first part)
node_major=${node_version#v}
node_major=${node_major%%.*}
if (( node_major < 20 )); then
    echo "Error: Node.js major version needs to be 20 or higher."
fi

if ! command -v npm > /dev/null; then
    echo "Error: Please install npm."
    exit 1
fi

npm_version=$(npm -v)
npm_major=${npm_version%%.*}
if (( npm_major < p )); then
    echo "Error: npm major version needs to be 9 or higher."
    exit 1
fi

if [ ! -d secvisogram ]; then
    echo "Secvisogram repo does not yet exists."
    git clone git@github.com:secvisogram/secvisogram.git
fi

cd secvisogram
git checkout main
git pull

echo "Installing or updating dependencies, this may take (and even hang) a while."
npm ci

echo
echo "=== Starting the server ==="
echo
echo "The server displaying the GUI will now be started."
echo "It is written in JavaScript, so give it a minute."
echo "It will then be avilable under"
echo
echo "http://localhost:$port"
echo

npm run dev --port=$port
