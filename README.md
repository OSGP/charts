<!--
SPDX-FileCopyrightText: Copyright Contributors to the GXF project

SPDX-License-Identifier: Apache-2.0
-->

# GXF's Helm Chart library
These Helm charts are design to facilitate the deployment of GXF (and depending applications) to Kubernetes.

## Usage
[Helm](https://helm.sh) must be installed to use the charts.  Please refer to Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add gxf-charts https://osgp.github.io/charts/

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.  You can then run `helm search repo
<alias>` to see the charts.

To install the <chart-name> chart:

    helm install my-<chart-name> <alias>/<chart-name>

To uninstall the chart:

    helm delete my-<chart-name>

## Probes
### Default probes
Some useful probes are available in GXF deployments. 
You can set `gxf.enableDefaultProbes` to `true` to enable simple probes on the three Kubernetes probes (startup, readiness and liveness). 
They will check for a text file `/probe/probe.txt` on Tomcat, which will only be served when Tomcat is started.

### Prometheus probe
When you use Prometheus metrics the GXF way (specifying the port through property `metrics.prometheus.port`), 
use that instead of the default probe, because it actually checks if your app is running. An example config for this situation:
```yaml
gxf:
  livenessProbe:
    failureThreshold: 6
    periodSeconds: 5
    httpGet:
      port: 9404
      path: /metrics
```

When you run multiple WARs in your container, you can also use the supplied probe script `/usr/local/bin/probe.sh` 
which tries to contact all Prometheus endpoints to see if the individual WARs are available. An example configuration for this situation:
```yaml
gxf:
  livenessProbe:
    failureThreshold: 3
    periodSeconds: 10
    exec:
      command:
        - /bin/bash
        - '-c'
        - source /usr/local/bin/probe.sh
```
