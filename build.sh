#!/bin/bash

set -e

BASEDIR=$(dirname $(readlink -f $0))
OUTPUTDIR=$BASEDIR/output

version=$(git describe --tags 2>/dev/null) || version=nover

typeset -a CARGS=(
    -a all
    -s dir
    -n certcheck
    -v"$version"
    --description "SSL Certificate checker"
    -m "szekeres@iii.hu"
    --prefix /usr
    --deb-no-default-config-files
    --vendor "Istvan Szekeres"
    --url "https://github.com/Pistahh/certcheck"
    -p output
)

typeset -a DIRS=( bin )

typeset -a DEB_DEPS=( -d python-openssl )
typeset -a PACMAN_DEPS=( -d python2-pyopenssl )

rm -rf $OUTPUTDIR
mkdir -p $OUTPUTDIR

(cd $BASEDIR && fpm -t deb    "${CARGS[@]}" "${DEB_DEPS[@]}"    "${DIRS[@]}")
(cd $BASEDIR && fpm -t pacman "${CARGS[@]}" "${PACMAN_DEPS[@]}" "${DIRS[@]}")

