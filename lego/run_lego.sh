#!/bin/sh

set -e
set -x

LE_PATH="${LE_PATH:-/letsencrypt}"

[ -n "${STAGING}" ] && STAGING_URL_SUFFIX='-staging'
URL="https://acme${STAGING_URL_SUFFIX}-v02.api.letsencrypt.org/directory"

KEY_TYPE="${KEY_TYPE:-ec256}"

MODE="${MODE:-renew}"
case "${MODE}" in
'run' | renew) ;;
*)
	printf 'invalid MODE\n'
	exit 1
	;;
esac

if [ -z "${DOMAINS}" ]; then
	printf 'Domain unset\n'
	exit 2
fi

if [ -z "${EMAIL}" ]; then
	printf 'Email unset\n'
	exit 3
fi

lego --accept-tos --path="${LE_PATH}" --server="${URL}" --email="${EMAIL}" \
	--key-type="${KEY_TYPE}" \
	--domains="${DOMAINS}" \
	--pem \
	--tls \
	"${MODE}"
