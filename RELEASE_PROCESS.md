# Release process

This process should be followed to release updated charts after a new version of Shipmight has been released.

## Update shipmight/shipmight

Update version number in:

- [`Chart.yaml`](charts/shipmight/Chart.yaml) → `version`
- [`values.yaml`](charts/shipmight/values.yaml) → `image.tag`

Commit and push:

```bash
git add -A
git commit -m "Release shipmight X.X.X"
git push
```

Wait for the chart to be released:

- https://github.com/shipmight/helm-charts/actions/workflows/release.yaml

## Update shipmight/shipmight-stack

Update version number in:

- [`Chart.yaml`](charts/shipmight-stack/Chart.yaml) → `version`
- [`Chart.yaml`](charts/shipmight-stack/Chart.yaml) → `dependencies[0].version`

Update `requirements.lock`:

```bash
cd charts/shipmight-stack && helm dependency update && cd ../..
```

Commit and push:

```bash
git add -A
git commit -m "Release shipmight-stack X.X.X"
git push
```

Wait for the chart to be released:

- https://github.com/shipmight/helm-charts/actions/workflows/release.yaml
