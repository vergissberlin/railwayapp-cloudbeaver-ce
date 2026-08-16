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

# TEMPORARY one-time reset: an earlier boot left a half-initialized security database on the
# volume (stuck in configuration mode, "User or team 'admin' already exists"). Wipe it once so
# CB_ADMIN_NAME/CB_ADMIN_PASSWORD auto-configuration can complete cleanly. Remove this block after
# the next successful deploy - it must never run against a volume with real connections/users.
rm -rf /opt/cloudbeaver/workspace/.data /opt/cloudbeaver/workspace/.metadata /opt/cloudbeaver/workspace/GlobalConfiguration

exec "${UPSTREAM_ENTRYPOINT}" "$@"
