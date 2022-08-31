# Shipmight (Helm Chart)

<img alt="Logos of components in Shipmight" src="https://github.com/shipmight/helm-charts/raw/master/images/chart-shipmight.png" height="64" />

This chart installs Shipmight but no additional resources. It can be used in scenarios where Shipmight stack is not suitable.

For most users it is recommended to use the [Shipmight stack](../shipmight-stack/README.md) chart. You can pick which dependencies you want (if any).

## Options

### Shipmight

Many of the Shipmight configuration options are explained in the documentation, see [Configuring Shipmight](https://shipmight.com/docs/configuring-shipmight).

| Option                        | Default                                     | Description                                             |
| ----------------------------- | ------------------------------------------- | ------------------------------------------------------- |
| `config.initialAdminUser`     | `"admin"`                                   | Initial user username                                   |
| `config.initialAdminPass`     | `"admin"`                                   | Initial user password                                   |
| `config.jwtSecret`            | `""`                                        | Secret string for signing JWTs, auto-generated if empty |
| `config.selfUpdateRepository` | `"https://shipmight.github.io/helm-charts"` | Helm chart repository used for self-update              |
| `config.lokiEndpoint`         | `""`                                        | Loki API endpoint, if available                         |
| `config.readableUuids`        | `true`                                      | Prefix random IDs with a slug of the entity name        |
| `config.uuidLength`           | `5`                                         | Random ID length                                        |

### Image

| Option              | Default                 | Description |
| ------------------- | ----------------------- | ----------- |
| `image.registry`    | `"ghcr.io"`             |             |
| `image.repository`  | `"shipmight/shipmight"` |             |
| `image.tag`         | `"<current-version>"`   |             |
| `image.pullPolicy`  | `"IfNotPresent"`        |             |
| `image.pullSecrets` | `[]`                    |             |

### Components

| Option                        | Default                            | Description |
| ----------------------------- | ---------------------------------- | ----------- |
| `ui.enabled`                  | `true`                             |             |
| `ui.replicas`                 | `1`                                |             |
| `ui.resources.limits`         | `{ memory: "100Mi", cpu: "100m" }` |             |
| `ui.resources.requests`       | `{ memory: "75Mi", cpu: "10m" }`   |             |
| `ui.ingress.enabled`          | `true`                             |             |
| `ui.ingress.extraAnnotations` | `{}`                               |             |
| `ui.ingress.extraLabels`      | `{}`                               |             |
| `ui.ingress.path`             | `/shipmight`                       |             |
| `ui.ingress.pathType`         | `Prefix`                           |             |
| `ui.ingress.hosts`            | `[]`                               |             |
| `ui.ingress.tls`              | `[]`                               |             |

| Option                   | Default                            | Description |
| ------------------------ | ---------------------------------- | ----------- |
| `api.enabled`            | `true`                             |             |
| `api.replicas`           | `1`                                |             |
| `api.resources.limits`   | `{ memory: "400Mi", cpu: "100m" }` |             |
| `api.resources.requests` | `{ memory: "75Mi", cpu: "10m" }`   |             |

| Option                       | Default                            | Description |
| ---------------------------- | ---------------------------------- | ----------- |
| `install.enabled`            | `true`                             |             |
| `install.resources.limits`   | `{ memory: "100Mi", cpu: "100m" }` |             |
| `install.resources.requests` | `{ memory: "75Mi", cpu: "10m" }`   |             |
