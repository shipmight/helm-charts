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

If you make changes to the shipmight-chart (not shipmight-stack), you need to rebuild the deps folder:

```bash
cd charts/shipmight-stack && helm dependency update && cd ../..
```

Now should be able to install as usual:

```bash
helm install shipmight-test charts/shipmight-stack -n shipmight --create-namespace
```

Start a minikube cluster:

```bash
minikube start --memory 6gb --cpus 2 --kubernetes-version=v1.21.4
```
