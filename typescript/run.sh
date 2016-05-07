#! /usr/bin/env bash

set -e

# There is probably a better way to do this, but this turns out to be a fiarly
# robust way to target the .nar execuatable.
NAR="$(find . | grep "typescript-.*x64\.nar" | head -n 1)"
chmod +x $NAR

# There is a race condition when compiling multiple ts_binaries. mkdir is
# atomic and has an error code when it can't make a file (making it a perfect
# lock). Lock on the .nar folder until .tsc_unlock is available.
if mkdir .nar 2> /dev/null; then
  until [[ -f .tsc_unlock ]]; do
    sleep .1s
  done
fi

args=()
for var in "$@"; do
  args+=("$(pwd)/${var}")
done

$NAR exec "--module amd ${FLAGS} --outFile ${args[*]}"
touch .tsc_unlock
