![Header: Shipmight Helm charts](images/header-image.png)

## Repository

The Helm repository is hosted in GitHub Pages and can be added via:

```bash
helm repo add shipmight https://shipmight.github.io/helm-charts
```

## Charts

### Shipmight stack

[![Logos of components in Shipmight stack](images/chart-shipmight-stack.png)](charts/shipmight-stack/README.md)

Recommended installation method. Included (optional) dependencies: Grafana Loki, Promtail, Cert-Manager, Ingress-NGINX, Metrics Server.

[**charts/shipmight-stack →**](charts/shipmight-stack/README.md)

### Shipmight

[![Logos of components in Shipmight](images/chart-shipmight.png)](charts/shipmight/README.md)

Shipmight without dependencies. Used as a dependency in Shipmight stack.

[**charts/shipmight →**](charts/shipmight/README.md)

## License

Contents of this repository are released under the Apache-2.0 license. See [LICENSE](LICENSE).

Software installed by these charts, including dependency charts, may be licensed differently. Refer to their respective license information.
