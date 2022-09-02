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

## License

This project is licensed under the Apache 2.0 license - see the LICENSE file for details

## Licenses third-party libraries
This project uses third-party libraries, which are licensed under their own respective Open-Source licenses. 

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Contact

If you have a question, please read [GXF wiki contact page](opensourcecommunity/communication-and-contact.md) how to best contact us.
