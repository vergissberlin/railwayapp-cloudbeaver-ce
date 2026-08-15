# CloudBeaver CE for railway.app

![Template Header](./template-header.svg)

Deploy CloudBeaver CE on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/REPLACE_WITH_RAILWAY_TEMPLATE_CODE?referralCode=2_sIT9&utm_medium=integration&utm_source=template&utm_campaign=generic)

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
