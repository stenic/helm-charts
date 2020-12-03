# prometheus-pve-exporter

## TL;DR;

```console
helm repo add stenic https://stenic.github.io/helm-charts
helm install my-release stenic/prometheus-pve-exporter
```

## Introduction

A Prometheus exporter for [Proxmox Virtual Environment](https://proxmox.com/en/proxmox-ve) metrics.

This chart bootstraps a [PVE Exporter](https://github.com/gesellix/pve-prometheus-exporter) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add stenic https://stenic.github.io/helm-charts
helm install my-release stenic/prometheus-pve-exporter
```

These commands deploy prometheus-pve-exporter on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Add the following to your prometheus configuration:

```yaml
scrape_configs:
  - job_name: 'pve'
    static_configs:
      - targets:
        - 192.168.1.2  # Proxmox VE node.
        - 192.168.1.3  # Proxmox VE node.
    metrics_path: /pve
    params:
      module: [default]
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: prometheus-pve-exporter:9221  # PVE exporter service.
```

The following tables list the configurable parameters of the prometheus-pve-exporter chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"prompve/prometheus-pve-exporter"` |  |
| image.tag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | string | `nil` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| pve.password | string | `"sEcr3T"` |  |
| pve.target | string | `nil` |  |
| pve.user | string | `"prometheus@pve"` |  |
| pve.verify_ssl | bool | `true` |  |
| rbac.create | bool | `true` |  |
| rbac.pspEnabled | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `9221` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml stenic/prometheus-pve-exporter
```
