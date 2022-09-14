# Shipmight stack (Helm Chart)

<img alt="Logos of components in Shipmight stack" src="https://github.com/shipmight/helm-charts/raw/master/images/chart-shipmight-stack.png" height="64" />

This is the recommended installation chart for most users, because it comes pre-configured. You can simply enable the dependencies you need.

The chart installs Shipmight and the following (optional) dependencies:

| Chart          | Enabled by default | Repository                                                                                                                                     |
| -------------- | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Ingress-NGINX  | Yes                | [kubernetes/ingress-nginx](https://github.com/kubernetes/ingress-nginx/blob/helm-chart-4.0.18/charts/ingress-nginx)                            |
| Loki           |                    | [grafana/helm-charts](https://github.com/grafana/helm-charts/blob/loki-2.10.1/charts/loki)                                                     |
| Promtail       |                    | [grafana/helm-charts](https://github.com/grafana/helm-charts/blob/promtail-2.2.0/charts/promtail)                                              |
| Cert-Manager   |                    | [cert-manager/cert-manager](https://github.com/cert-manager/cert-manager/blob/v1.7.1/deploy/charts/cert-manager)                               |
| Metrics Server |                    | [kubernetes-sigs/metrics-server](https://github.com/kubernetes-sigs/metrics-server/blob/metrics-server-helm-chart-3.8.2/charts/metrics-server) |

## Usage

```bash
helm repo add shipmight https://shipmight.github.io/helm-charts
helm repo update
helm install shipmight shipmight/shipmight-stack
```

## Examples

### Default installation (includes Ingress-NGINX)

```bash
helm install shipmight shipmight/shipmight-stack
```

### Enable Loki

```bash
helm install shipmight shipmight/shipmight-stack \
  --set promtail.enabled=true \
  --set loki.enabled=true \
  --set loki.config.storage_config.aws.s3=s3://<access-key>:<secret-access-key>@<s3-endpoint>/<bucket-name> \
  --set shipmight.config.lokiEndpoint=http://shipmight-loki:3100
```

More information can be found in the [docs](https://shipmight.com/docs/configuring-loki).

### Enable Cert-Manager

```bash
helm install shipmight shipmight/shipmight-stack \
  --set cert-manager.enabled=true
# Create a ClusterIssuer with `cert-manager-issuer.shipmight.com/id: <id>` annotation
kubectl create -f your-cluster-issuer.yaml
```

More information and example ACME (Let's Encrypt) issuer YAML can be found in the [docs](https://shipmight.com/docs/configuring-cert-manager).

### Enable Metrics Server

Note: if your cloud provider offers a one-click installation of Metrics Server, use it instead. Installation via Helm may require additional configuration depending on your cloud platform.

```bash
helm install shipmight shipmight/shipmight-stack \
  --set metrics-server.enabled=true
```

More information can be found in the [docs](https://shipmight.com/docs/configuring-metrics-server).

### Disable Ingress-NGINX

```bash
helm install shipmight shipmight/shipmight-stack \
  --set ingress-nginx.enabled=false
```

### Configure Shipmight

Shipmight is a dependency chart, so prepend all configuration values with `shipmight.`. For example:

```bash
helm install shipmight shipmight/shipmight-stack \
  --set shipmight.config.selfUpdateRepository=... \
  --set shipmight.image.tag=...
```

See the [shipmight](../shipmight) chart for descriptions of available configuration options.

## Options

### Dependencies

This chart does not have any configuration of its own. All configuration is done via dependency charts.

| Option             | Description                                                                                                                                                                                                                                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `shipmight.*`      | See [README.md](../shipmight) and [values.yaml](../shipmight/values.yaml)                                                                                                                                                                                                 |
| `ingress-nginx.*`  | See [README.md](https://github.com/kubernetes/ingress-nginx/blob/helm-chart-4.0.18/charts/ingress-nginx) and [values.yaml](https://github.com/kubernetes/ingress-nginx/blob/helm-chart-4.0.18/charts/ingress-nginx/values.yaml)                                           |
| `loki.*`           | See [README.md](https://github.com/grafana/helm-charts/blob/loki-2.10.1/charts/loki) and [values.yaml](https://github.com/grafana/helm-charts/blob/loki-2.10.1/charts/loki/values.yaml)                                                                                   |
| `promtail.*`       | See [README.md](https://github.com/grafana/helm-charts/blob/promtail-2.2.0/charts/promtail) and [values.yaml](https://github.com/grafana/helm-charts/blob/promtail-2.2.0/charts/promtail/values.yaml)                                                                     |
| `cert-manager.*`   | See [README.md](https://github.com/cert-manager/cert-manager/blob/v1.7.1/deploy/charts/cert-manager) and [values.yaml](https://github.com/cert-manager/cert-manager/blob/v1.7.1/deploy/charts/cert-manager/values.yaml)                                                   |
| `metrics-server.*` | See [README.md](https://github.com/kubernetes-sigs/metrics-server/blob/metrics-server-helm-chart-3.8.2/charts/metrics-server) and [values.yaml](https://github.com/kubernetes-sigs/metrics-server/blob/metrics-server-helm-chart-3.8.2/charts/metrics-server/values.yaml) |
