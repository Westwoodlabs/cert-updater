#!/bin/sh

tempfile="/tmp/cert.pem"
CHECK_INTERVAL=${CHECK_INTERVAL:=10}

while true
do
    echo "Check for a new public certificate"

    online_md5="$(curl -sL $CERT_WEB | md5sum | cut -d ' ' -f 1)"
    local_md5="$(md5sum "$CERT_LOCAL" | cut -d ' ' -f 1)"

    if [ "$online_md5" == "$local_md5" ]; then
        printf "> local cert is up-to-date!\n"
    else
        printf "> local cert is outdated. start update...\n"

        curl -sL "$CERT_WEB" -o "$tempfile"

        cp "$tempfile" "$CERT_LOCAL"

        touch "$TRAEFIK_DYNAMIC"

        printf "> update done!\n"

    fi
    echo "> sleep for $CHECK_INTERVAL seconds."
    sleep $CHECK_INTERVAL
done

