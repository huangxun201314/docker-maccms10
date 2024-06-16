#!/bin/sh
set -eu

if [ ! -f index.php ]; then
    git clone --depth 1 -q ${REPO_URL} .
    rm -rf .git*
    chmod a+rw -R application runtime upload static addons
    unzip template/cmsV10.zip -d template
    rm -rf template/cmsV10.zip
    echo "maccms10 downloaded"
fi

if [ -f admin.php ]; then
    mv admin.php $ADMIN_PHP
    echo "admin.php => $ADMIN_PHP"
fi

exec "$@"
