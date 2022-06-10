# Shipmight stack (Helm Chart)

<img alt="Logos of components in Shipmight stack" src="https://github.com/shipmight/helm-charts/raw/master/images/chart-shipmight-stack.png" height="64" />

This chart installs Shipmight and the following (optional) dependencies:

- Ingress-NGINX (enabled by default)
- Loki
- Promtail
- Cert-Manager
- Metrics Server

This is the recommended installation chart for most users, because it comes pre-configured so you can simply enable the dependencies you need.

## Usage

```bash
helm repo add shipmight https://shipmight.github.io/helm-charts
helm repo update
helm install shipmight shipmight/shipmight-stack
```

## Options

### Dependencies

This chart does not have any configuration of its own. All configuration is done via dependency charts.

| Option             | Description                                                                                                                                                |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `shipmight.*`      | See [shipmight/values.yaml](../shipmight/values.yaml)                                                                                                      |
| `ingress-nginx.*`  | See [ingress-nginx/values.yaml](https://github.com/kubernetes/ingress-nginx/blob/helm-chart-4.0.18/charts/ingress-nginx/values.yaml)                       |
| `loki.*`           | See [loki/values.yaml](https://github.com/grafana/helm-charts/blob/loki-2.10.1/charts/loki/values.yaml)                                                    |
| `promtail.*`       | See [promtail/values.yaml](https://github.com/grafana/helm-charts/blob/promtail-2.2.0/charts/promtail/values.yaml)                                         |
| `cert-manager.*`   | See [cert-manager/values.yaml](https://github.com/cert-manager/cert-manager/blob/v1.7.1/deploy/charts/cert-manager/values.yaml)                            |
| `metrics-server.*` | See [metrics-server/values.yaml](https://github.com/kubernetes-sigs/metrics-server/blob/metrics-server-helm-chart-3.8.2/charts/metrics-server/values.yaml) |
