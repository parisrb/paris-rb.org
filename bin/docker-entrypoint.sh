#!/bin/sh
unset BUNDLE_PATH
unset BUNDLE_BIN

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

exec $@
