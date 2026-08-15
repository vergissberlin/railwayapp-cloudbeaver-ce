# CloudBeaver CE for railway.app

![Template Header](./template-header.svg)

Deploy CloudBeaver CE on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/cloudbeaver-ce?referralCode=2_sIT9&utm_medium=integration&utm_source=template&utm_campaign=generic)

# Deploy and Host CloudBeaver CE on Railway

CloudBeaver CE is the open-source, web-based SQL client from the DBeaver team. This template
packages the official `dbeaver/cloudbeaver` Docker image so you can deploy a fully working
instance on Railway in a single click, without installing a desktop database client or managing
a server yourself.

## About Hosting CloudBeaver CE

CloudBeaver CE runs entirely in the browser: connect to PostgreSQL, MySQL, SQLite, MongoDB, and
many other databases through one shared web UI. Hosting it on Railway means Railway builds the
Docker image, terminates TLS on a public domain, and keeps the container restarted and healthy —
you only manage the data sources you connect to.

## Why Deploy CloudBeaver CE on Railway

* **Zero infrastructure management** — no VM or Docker host to patch or size
* **Instant HTTPS** — Railway issues a public domain with TLS out of the box
* **Persistent storage** — a Railway volume keeps connections, users, and settings across redeploys
* **Automatic rebuilds** — Renovate keeps the pinned upstream image current, Railway redeploys on push
* **Team access** — invite teammates to the same Railway project instead of sharing local installs

## Common Use Cases

* Giving a team shared, browser-based access to shift/prod databases without VPN-only desktop tools
* A lightweight admin UI for a database already running on Railway (Postgres, MySQL, MongoDB, …)
* Ad-hoc SQL exploration and reporting during development or debugging
* Onboarding new engineers with one shared login instead of installing a desktop SQL client each

## Dependencies for CloudBeaver CE

* The official `dbeaver/cloudbeaver` Docker image (pinned tag, see `Dockerfile`)
* A Railway volume mounted at `/opt/cloudbeaver/workspace` for persistent configuration and data
* Network access to whichever databases you connect to from within CloudBeaver

## ✨ Features

* Web-based UI for browsing, querying, and managing SQL/NoSQL databases
* Supports PostgreSQL, MySQL, SQLite, MongoDB, and many other drivers
* Multi-user access with role-based permissions

## 🚀 Quick Start

1. Click "Deploy on Railway"
2. Set the environment variables listed below
3. Attach a volume at `/opt/cloudbeaver/workspace` before sending production traffic
4. Wait for the build and open the generated URL

## ⚙️ Configuration

### Environment variables

```bash
# This template needs no required variables.
```

Set real credentials as Railway variables, never in a file inside this repository.

### Optional

* `PORT`: HTTP port CloudBeaver CE binds to (default: `8978`). Railway sets this for you;
  leave it alone unless you also change the domain's target port.

## 💾 Persistence

`railway.toml` declares `requiredMountPath = "/opt/cloudbeaver/workspace"`. Attach a Railway volume to that
path before production traffic, otherwise all data is lost on every redeploy.

## 🐳 Local Development

```bash
git clone https://github.com/vergissberlin/railwayapp-cloudbeaver-ce.git
cd railwayapp-cloudbeaver-ce
cp .env.example .env
docker compose up -d
```

Then open http://localhost:8978.

## 🪲 Bug Reporting

Found a bug? [Create an issue](https://github.com/vergissberlin/railwayapp-cloudbeaver-ce/issues/new) or open a pull request with a fix.

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## 📝 License

MIT — see [LICENSE](LICENSE).

## 🔒 Security

* All credentials are supplied as environment variables, never committed
* Railway terminates TLS for the generated domain
* Renovate keeps the pinned upstream image up to date

## Railway runtime defaults

`railway.toml` ships these defaults:

* Healthcheck path: `/`
* Restart policy: `ON_FAILURE` with up to 10 retries
* Dockerfile-based build

The image entrypoint (`railway-entrypoint.sh`) maps `$PORT` to `CLOUDBEAVER_WEB_SERVER_PORT` and then
delegates to the upstream entrypoint, so the upstream initialisation still runs. Overriding the
start command in Railway skips both steps.

## 📚 Resources

* [CloudBeaver CE documentation](https://github.com/dbeaver/cloudbeaver/wiki)
* [Railway documentation](https://docs.railway.app/)
* [Template updates](https://docs.railway.com/reference/templates#updatable-templates)

<!-- footer -->
---

[![Airbyte](https://img.shields.io/badge/Airbyte-615EFF?style=for-the-badge&logo=airbyte&logoColor=white)](https://github.com/vergissberlin/railwayapp-airbyte) [![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-017CEE?style=for-the-badge&logo=apacheairflow&logoColor=white)](https://github.com/vergissberlin/railwayapp-airflow) [![CloudBeaver](https://img.shields.io/badge/CloudBeaver-382923?style=for-the-badge&logo=dbeaver&logoColor=white)](https://github.com/vergissberlin/railwayapp-cloudbeaver-ce) [![CodiMD](https://img.shields.io/badge/CodiMD-0F766E?style=for-the-badge&logo=markdown&logoColor=white)](https://github.com/vergissberlin/railwayapp-codimd) [![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white)](https://github.com/vergissberlin/railwayapp-django) [![Email Service](https://img.shields.io/badge/Email%20Service-2563EB?style=for-the-badge&logo=maildotru&logoColor=white)](https://github.com/vergissberlin/railwayapp-email) [![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)](https://github.com/vergissberlin/railwayapp-fastapi) [![Flask](https://img.shields.io/badge/Flask-3fad48?style=for-the-badge&logo=flask&logoColor=white)](https://github.com/vergissberlin/railwayapp-flask) [![Flowise](https://img.shields.io/badge/Flowise-4F46E5?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://github.com/vergissberlin/railwayapp-flowise) [![GitLab CE](https://img.shields.io/badge/GitLab%20CE-FC6D26?style=for-the-badge&logo=gitlab&logoColor=white)](https://github.com/vergissberlin/railwayapp-gitlab) [![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)](https://github.com/vergissberlin/railwayapp-grafana) [![Home Assistant](https://img.shields.io/badge/Home%20Assistant-18BCF2?style=for-the-badge&logo=homeassistant&logoColor=white)](https://github.com/vergissberlin/railwayapp-homeassistant) [![InfluxDB](https://img.shields.io/badge/InfluxDB-22ADF6?style=for-the-badge&logo=influxdb&logoColor=white)](https://github.com/vergissberlin/railwayapp-influxdb) [![MJML](https://img.shields.io/badge/MJML-F45E43?style=for-the-badge&logo=mjml&logoColor=white)](https://github.com/vergissberlin/railwayapp-mjml) [![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)](https://github.com/vergissberlin/railwayapp-mongodb) [![Mosquitto MQTT](https://img.shields.io/badge/Mosquitto%20MQTT-3C5280?style=for-the-badge&logo=eclipsemosquitto&logoColor=white)](https://github.com/vergissberlin/railwayapp-mqtt) [![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://github.com/vergissberlin/railwayapp-mysql) [![n8n](https://img.shields.io/badge/n8n-EA4B71?style=for-the-badge&logo=n8n&logoColor=white)](https://github.com/vergissberlin/railwayapp-n8n) [![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://github.com/vergissberlin/railwayapp-nodejs) [![Node-RED](https://img.shields.io/badge/Node-RED-8F0000?style=for-the-badge&logo=nodered&logoColor=white)](https://github.com/vergissberlin/railwayapp-nodered) [![OpenSearch](https://img.shields.io/badge/OpenSearch-005EB8?style=for-the-badge&logo=opensearch&logoColor=white)](https://github.com/vergissberlin/railwayapp-opensearch) [![Open WebUI](https://img.shields.io/badge/Open%20WebUI-D68E42?style=for-the-badge&logo=ollama&logoColor=white)](https://github.com/vergissberlin/railwayapp-openwebui) [![Outerbase Studio](https://img.shields.io/badge/Outerbase%20Studio-000000?style=for-the-badge&logo=outerbase&logoColor=white)](https://github.com/vergissberlin/railwayapp-outerbase-studio) [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://github.com/vergissberlin/railwayapp-postgresql) [![Redis](https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white)](https://github.com/vergissberlin/railwayapp-redis) [![TYPO3 CMS](https://img.shields.io/badge/TYPO3%20CMS-FF8700?style=for-the-badge&logo=typo3&logoColor=white)](https://github.com/vergissberlin/railwayapp-typo3)
