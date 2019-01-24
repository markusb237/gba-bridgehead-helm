# gba-bridgehead-helm
Helm-Charts for the GBA Bridgehead (Store and Connector)

## Usage
You can run both, store and connector, or just one of them. Typically you first start the store, and then the connector.

### Configuration
1. Go into directories `helm/gba-store/` and `helm/gba-connector` and fit `values.yaml` to your needs.
2. In those directories change `gba-store.yaml` and `gba-connector.yaml` to your needs.
   If you use a proxy, its recommended to un-comment the annotations for the timeout.
   You will find some help for configuring the ingress here: https://github.com/helm/charts/tree/master/stable/nginx-ingress
   
### Running
1. First in `helm/gba-store/`, then in `helm/gba-connector/` run `./apply.sh`. This will run the install script and install helm dependencies.
2. You'll be asked for a postgres password. Make sure to save it in a keepass. If you're an admin, you can view it in Kubernetes Dashboard later.

### Hints
Feel free to contribute! :)

Store uses `samply/samply.store` image, because we had proxy problems with `martinbreu/samply-store`.
Connector's image is `martinbreu/samply-connector`.
