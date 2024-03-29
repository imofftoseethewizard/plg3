#! /usr/bin/env bash

# Adapted from pgxn-tools' pg-start. It does everything the original
# does except start the cluster.

set -eu

# Determine the version of PostgreSQL (and append .0 to a single digit)
if [ -z ${1+x} ]; then
    echo "ERROR: No PostgreSQL version number passed to $0"
    echo "Usage:"
    echo "  $0 \$PGVERSION"
    exit 2
fi

PGVERSION=$1
[[ $PGVERSION =~ ^[0-9]$ ]] && PGVERSION+=.0

set -x
sudo apt.postgresql.org.sh -i -v $PGVERSION
if [ $# -gt 1 ]; then
    sudo apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install -y "${@:2}"
fi

pg_createcluster $PGVERSION test -p "${PGPORT:-5432}" -- -A trust
