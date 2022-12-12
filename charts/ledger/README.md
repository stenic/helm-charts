# ⚠️ Repo Archive Notice

> This chart has been moved to https://artifacthub.io/packages/helm/ledger/ledger

# ledger

## TL;DR;

```console
helm repo add stenic https://charts.stenic.io
helm install my-release stenic/ledger
```

## Introduction

This chart installs `ledger` on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add stenic https://charts.stenic.io
helm install my-release stenic/ledger
```

These commands deploy ledger on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables list the configurable parameters of the ledger chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"stenicbv/ledger"` |  |
| image.tag | string | `""` |  |
| imagePullSecretName | string | `nil` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hostName | string | `"ledger.example.com"` |  |
| ingress.tls | string | `nil` |  |
| ledger.adminPassword | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClass | string | `nil` |  |
| podSecurityContext | object | `{}` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"64Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"28Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| statefulset.volume.name | string | `"ledger"` |  |
| statefulset.volume.path | string | `"/data"` |  |
| tolerations | list | `[]` |  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml stenic/ledger
```
