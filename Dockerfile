ARG VERSION=26.2.2

FROM dbeaver/cloudbeaver:${VERSION}

LABEL maintainer="VergissBerlin"
LABEL description="CloudBeaver CE Template for Railway"

# Railway ignores EXPOSE and routes traffic to the port named by $PORT.
# EXPOSE documents the local default, ENV PORT keeps that default reproducible.
ENV PORT=8978
EXPOSE 8978

# Translate Railway's $PORT into CLOUDBEAVER_WEB_SERVER_PORT, then delegate to the upstream
# entrypoint so its initialisation and privilege drop still happen.
COPY railway-entrypoint.sh /usr/local/bin/railway-entrypoint.sh
RUN chmod +x /usr/local/bin/railway-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/railway-entrypoint.sh"]
