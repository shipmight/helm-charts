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
