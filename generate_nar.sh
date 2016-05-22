#! /usr/bin/env bash

set -o errexit
set -o nounset

# Script to generate nar files for typescript that can be used by bazel-typescript.

TEMP="$(mktemp -d /tmp/typescript.nar.XXXXXXXX)"

if which node; then
  echo "This program requires Node to be installed. Visit http://nodejs.org for instructions on installation."
fi

if which npm; then
  echo "This program requires NPM to be installed. Visit http://npmjs.com for instructions on installation."
fi

cd "${TEMP}" || (echo "Failed to create tempdir"; exit 1)
git clone https://github.com/Microsoft/TypeScript
cd TypeScript || (echo "Failed to clone TypeScript"; exit 1)
npm install nar
node ./node_modules/nar/bin/nar create --executable --os darwin --arch x64
node ./node_modules/nar/bin/nar create --executable --os linux --arch x64 

cp "${TEMP}/TypeScript/typescript-1.9.0-darwin-x64.nar" "${TEMP}"
cp "${TEMP}/TypeScript/typescript-1.9.0-linux-x64.nar" "${TEMP}"

echo "Releaseable nar binaries now exist in ${TEMP}"

echo "Important information for release"
shasum -a 256 "${TEMP}/*.nar"





