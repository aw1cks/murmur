#!/bin/sh

set -eux

_ITER=0

until [ -n "$(find /letsencrypt -name '*.pem' -print0)" ]; do
	if [ "${_ITER}" -gt '12' ]; then
		printf 'Could not find certs\n'
		exit 1
	fi

	sleep 5

	_ITER="$((_ITER + 1))"
done

murmurd -fg -ini '/murmur.conf'
