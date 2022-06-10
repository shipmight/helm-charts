# Shipmight stack (Helm Chart)

<img alt="Logos of components in Shipmight stack" src="../images/chart-shipmight-stack.png" height="64" />

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

| Option             | Description                                                                                                                       |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `shipmight.*`      | See [shipmight/values.yaml](../shipmight/values.yaml)                                                                             |
| `ingress-nginx.*`  | See [ingress-nginx/values.yaml](https://github.com/nginxinc/kubernetes-ingress/blob/master/deployments/helm-chart/values.yaml)    |
| `loki.*`           | See [loki/values.yaml](https://github.com/grafana/helm-charts/blob/main/charts/loki/values.yaml)                                  |
| `promtail.*`       | See [promtail/values.yaml](https://github.com/grafana/helm-charts/blob/main/charts/promtail/values.yaml)                          |
| `cert-manager.*`   | See [cert-manager/values.yaml](https://github.com/jetstack/cert-manager/blob/master/deploy/charts/cert-manager/values.yaml)       |
| `metrics-server.*` | See [metrics-server/values.yaml](https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/values.yaml) |
