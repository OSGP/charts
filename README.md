<!--
SPDX-FileCopyrightText: Contributors to the Charts project

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
