# Release process

This process should be followed to release updated charts after a new version of Shipmight has been released.

## Prerequisites

Make sure to have released a new shipmight image version if it's necessary for this update.

## Release new version of shipmight/shipmight chart

- Make a new branch

  - Name: `wip-shipmight-X.X.X` (DON'T use `shipmight-X.X.X` because it's the tag that chart-releaser will use)

- Update chart version

  - [`Chart.yaml`](charts/shipmight/Chart.yaml) → `version`

- Update image version (if necessary)

  - [`values.yaml`](charts/shipmight/values.yaml) → `image.tag`

- Make a new PR

  - In: [helm-charts/shipmight](https://github.com/helm-charts/shipmight)
  - Title: "Release shipmight X.X.X"

- Merge the PR

- Wait until release workflow is finished
  - Wait for the [workflow](https://github.com/shipmight/helm-charts/actions/workflows/release.yaml)
  - Explicitly check that the chart-releaser-action step uploaded the new chart version to GitHub Pages

## Release new version of shipmight/shipmight-stack chart

- Switch back to master

  - `git checkout master && git pull`

- Make a new branch

  - Name: `wip-shipmight-stack-X.X.X` (DON'T use `shipmight-stack-X.X.X` because it's the tag that chart-releaser will use)

- Update chart version

  - [`Chart.yaml`](charts/shipmight-stack/Chart.yaml) → `version`

- Update shipmight/shipmight dependency version

  - [`Chart.yaml`](charts/shipmight-stack/Chart.yaml) → `dependencies[0].version`

- Make a new PR

  - In: [helm-charts/shipmight](https://github.com/helm-charts/shipmight)
  - Title: "Release shipmight-stack X.X.X"

- Merge the PR

- Wait until release workflow is finished
  - Wait for the [workflow](https://github.com/shipmight/helm-charts/actions/workflows/release.yaml)
  - Explicitly check that the chart-releaser-action step uploaded the new chart version to GitHub Pages
