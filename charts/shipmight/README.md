# Shipmight Helm Chart

This chart install Shipmight but no additional resources. It is suitable for customizing your setup.

See also [Shipmight stack](../shipmight-stack/README.md).

## Options

### Image

| Option              | Default                 | Description                  |
| ------------------- | ----------------------- | ---------------------------- |
| `image.registry`    | `"ghcr.io"`             | Shipmight image registry     |
| `image.repository`  | `"shipmight/shipmight"` | Shipmight image repository   |
| `image.tag`         | `"<current-version>"`   | Shipmight image tag          |
| `image.pullPolicy`  | `"IfNotPresent"`        | Shipmight image pull policy  |
| `image.pullSecrets` | `[]`                    | Shipmight image pull secrets |

### User authentication

| Option                  | Default   | Description                                                                             |
| ----------------------- | --------- | --------------------------------------------------------------------------------------- |
| `auth.initialAdminUser` | `"admin"` | Upon installation an admin user is created. User must change password upon first login. |
| `auth.initialAdminPass` | `"admin"` |                                                                                         |
| `auth.jwtSecret`        | `""`      | JWT secret for verifying and generating auth tokens                                     |

### Shipmight UI

| Option           | Default       | Description                                                                                    |
| ---------------- | ------------- | ---------------------------------------------------------------------------------------------- |
| `ui.ingressPath` | `"shipmight"` | Path to use in Shipmight UI ingress. No leading or trailing slash. Can be set to empty string. |
| `ui.ingressHost` |               | Host to use in Shipmight UI ingress.                                                           |

Also see [Deployment parameters](#deployment-parameters).

### Shipmight API

| Option              | Default | Description                                                                     |
| ------------------- | ------- | ------------------------------------------------------------------------------- |
| `api.readableUuids` | `true`  | If true, UUIDs include a slug-version of the resource name, e.g. `my-app-87df3` |
| `api.uuidLength`    | `5`     | Amount of random characters in the UUID                                         |

Also see [Deployment parameters](#deployment-parameters).

### Domains

| Option                 | Default           | Description                                |
| ---------------------- | ----------------- | ------------------------------------------ |
| `domains.ingressClass` | `"ingress-nginx"` | Currently only ingress-nginx is supported. |

### ACME ClusterIssuer

| Option                                | Default                                            | Description                                                       |
| ------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------- |
| `acmeClusterIssuer.enabled`           | `false`                                            | If true, Let’s Encrypt `ClusterIssuer` is installed               |
| `acmeClusterIssuer.adminEmailAddress` | `""`                                               | Email address to which Let’s Encrypt may send email notifications |
| `acmeClusterIssuer.name`              | `"Let’s Encrypt"`                                  |                                                                   |
| `acmeClusterIssuer.server`            | `"https://acme-v02.api.letsencrypt.org/directory"` | Defaults to Let’s Encrypt production API                          |

### Loki

| Option          | Default                        | Description |
| --------------- | ------------------------------ | ----------- |
| `loki.endpoint` | `"http://shipmight-loki:3100"` |             |

### Deployment parameters

| Option                   | Default                            | Description |
| ------------------------ | ---------------------------------- | ----------- |
| `ui.replicas`            | `1`                                |             |
| `ui.resources.limits`    | `{ memory: "100Mi", cpu: "100m" }` |             |
| `ui.resources.requests`  | `{ memory: "100Mi", cpu: "100m" }` |             |
| `api.replicas`           | `1`                                |             |
| `api.resources.limits`   | `{ memory: "100Mi", cpu: "100m" }` |             |
| `api.resources.requests` | `{ memory: "100Mi", cpu: "100m" }` |             |
