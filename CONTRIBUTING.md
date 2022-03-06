# Contributing

## Testing locally

Manually point shipmight-stack to use local version:

- [`Chart.yaml`](charts/shipmight-stack/Chart.yaml) → `dependencies[0].repository`

```yaml
# Before
- repository: "https://shipmight.github.io/helm-charts"
# After
- repository: "file://../shipmight"
```

Update `requirements.lock`:

```bash
cd charts/shipmight-stack && helm dependency update && cd ../..
```

You need to run that command after every change to shipmight-chart.

Now should be able to install as usual:

```bash
helm install shipmight-test charts/shipmight-stack -n shipmight --create-namespace
```
