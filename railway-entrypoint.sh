#!/bin/bash
set -euo pipefail

readonly UPSTREAM_ENTRYPOINT='/opt/cloudbeaver/launch-product.sh'
port="${PORT:-8978}"

if ! [[ "${port}" =~ ^[0-9]+$ ]] || ((port < 1 || port > 65535)); then
	echo "railway-entrypoint: PORT='${port}' is not a valid port number (1-65535)" >&2
	exit 1
fi

# An explicitly configured value always wins over the derived one.
export CLOUDBEAVER_WEB_SERVER_PORT="${CLOUDBEAVER_WEB_SERVER_PORT:-${port}}"

exec "${UPSTREAM_ENTRYPOINT}" "$@"
