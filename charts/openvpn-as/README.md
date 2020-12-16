# openvpn-as

## TL;DR;

```console
helm repo add stenic https://stenic.github.io/helm-charts
helm install my-release --set "service.type=LoadBalancer" stenic/openvpn-as
```

## Introduction

This chart installs `openvpn-as` on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

[![openvpn-as](https://raw.githubusercontent.com/stenic/helm-charts/master/img/openvpn-as.png)](https://openvpn.net/index.php/access-server/overview.html)

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
| affinity | object | `{}` | Affinity labels for pod assignment |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ghcr.io/linuxserver/openvpn-as"` | Image repository |
| image.tag | string | `""` | Image tag |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| ingress.admin.annotations | object | `{}` | Ingress annotations |
| ingress.admin.enabled | bool | `false` | Enable ingress resource for Admin GUI |
| ingress.admin.hostName | string | `"admin.openvpn.local"` |  |
| ingress.admin.tls.enabled | bool | `true` | Enable TLS configuration for the hostname defined at ingress.admin.hostname parameter |
| ingress.admin.tls.secretName | string | `"admin.openvpn-tls"` |  |
| ingress.gui.annotations | object | `{}` | Ingress annotations |
| ingress.gui.enabled | bool | `false` | Enable ingress resource for Client GUI |
| ingress.gui.hostName | string | `"client.openvpn.local"` |  |
| ingress.gui.tls.enabled | bool | `true` | Enable TLS configuration for the hostname defined at ingress.gui.hostname parameter |
| ingress.gui.tls.secretName | string | `"client.openvpn-tls"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| openvpn.admin.password | string | `"passw0rd"` | Password for the initial super_user |
| openvpn.admin.user | string | `"altmin"` | Username for the initial super_user. **cannot be** `admin` |
| openvpn.config | object | `{"vpn.client.routing.reroute_dns":"false","vpn.client.routing.reroute_gw":"false"}` | Config settings to apply to the openvpn-as server |
| openvpn.ports.admin | int | `943` | Admin GUI port |
| openvpn.ports.gui | int | `944` | Client GUI port |
| openvpn.ports.tcp | int | `9443` | VPN TCP port |
| openvpn.ports.udp | int | `1194` | VPN UDP port |
| openvpn.users | list | `nil` | Additional users to create when non-existent `[{"user":"someuser","password":"somepassword"}]` |
| openvpn.timezone | string | `"Europe/London"` | Server timezone |
| persistence.accessMode | string | `"ReadWriteOnce"` | PVC Access Mode for volume |
| persistence.annotations | object | `{}` | Annotations for the PVC |
| persistence.enabled | bool | `true` | Enable persistence using PVC |
| persistence.size | string | `"8Gi"` | PVC Storage Request for volume |
| persistence.storageClass | string | `nil` | PVC Storage Class for volume |
| persistence.existingClaimName | string | `nil` | To use an existing PVC Storage by its name instead of creating one |
| persistence.backupSubpath | string | `"backup"` | To customize subpath for backups on PVC Storage |
| persistence.licensesSubpath | string | `"licenses"` | To customize subpath for licenses on PVC Storage |
| podAnnotations | object | `{}` | Map of annotations to add to the pods |
| podSecurityContext.fsGroup | int | `1000` | Group ID for the pod |
| replicaCount | int | `1` |  |
| resources | object | `{}` | CPU/Memory resource requests/limits |
| securityContext | object | `{"capabilities":{"add":["NET_ADMIN"]}}` | Security Context |
| service.admin.type | string | `"ClusterIP"` | Kubernetes Service type for Admin GUI |
| service.gui.type | string | `"ClusterIP"` | Kubernetes Service type for Client GUI |
| service.type | string | `"ClusterIP"` | Kubernetes Service type for VPN, generally this is "LoadBalancer" |
| service.udp.enabled | bool | `true` | Create Service for UDP Traffic VPN |
| service.tcp.enabled | bool | `true` | Create Service for TCP Traffic VPN |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` | Create ServiceAccount |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` | Toleration labels for pod assignment |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml stenic/openvpn-as
```
