# openvpn-as

## TL;DR;

```console
helm repo add stenic https://stenic.github.io/helm-charts
helm install my-release --set "service.type=LoadBalancer" stenic/openvpn-as
```

## Introduction

This chart installs `openvpn-as` on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+
- LoadBalancer to expose the vpn service
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add stenic https://stenic.github.io/helm-charts
helm install my-release --set "service.type=LoadBalancer" stenic/openvpn-as
```

These commands deploy openvpn-as on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables list the configurable parameters of the openvpn-as chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/linuxserver/openvpn-as"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.admin.annotations | object | `{}` |  |
| ingress.admin.enabled | bool | `false` |  |
| ingress.admin.hostName | string | `"openvpn.local"` |  |
| ingress.admin.tls.enabled | bool | `true` |  |
| ingress.admin.tls.secretName | string | `"openvpn-tls"` |  |
| ingress.gui.annotations | object | `{}` |  |
| ingress.gui.enabled | bool | `false` |  |
| ingress.gui.hostName | string | `"openvpn.local"` |  |
| ingress.gui.tls.enabled | bool | `true` |  |
| ingress.gui.tls.secretName | string | `"openvpn-tls"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| openvpn.admin.password | string | `"passw0rd"` |  |
| openvpn.admin.user | string | `"altmin"` |  |
| openvpn.config."vpn.client.routing.reroute_dns" | string | `"false"` |  |
| openvpn.config."vpn.client.routing.reroute_gw" | string | `"false"` |  |
| openvpn.ports.admin | int | `943` |  |
| openvpn.ports.gui | int | `944` |  |
| openvpn.ports.tcp | int | `9443` |  |
| openvpn.ports.udp | int | `1194` |  |
| openvpn.users | string | `nil` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClass | string | `nil` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| service.admin.type | string | `"ClusterIP"` |  |
| service.gui.type | string | `"ClusterIP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml stenic/openvpn-as
```
