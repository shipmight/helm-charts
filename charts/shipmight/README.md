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

### Shipmight configuration

| Option     | Default | Description                                                                           |
| ---------- | ------- | ------------------------------------------------------------------------------------- |
| `config.*` |         | Refer to [Shipmight documentation](https://shipmight.com/docs/configuring-shipmight). |

### Components

| Option      | Default                             | Description |
| ----------- | ----------------------------------- | ----------- |
| `ui.*`      | Refer to [values.yaml](values.yaml) |             |
| `admin.*`   | Refer to [values.yaml](values.yaml) |             |
| `install.*` | Refer to [values.yaml](values.yaml) |             |
