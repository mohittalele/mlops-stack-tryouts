#!/bin/bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

wget https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz
tar -xf k9s_Linux_x86_64.tar.gz

mv k9s /usr/local/bin

helm repo add flyteorg https://helm.flyte.org
helm install -n flyte flyte-deps flyteorg/flyte-deps --create-namespace -f https://raw.githubusercontent.com/flyteorg/flyte/master/charts/flyte-deps/values-sandbox.yaml
helm install flyte flyteorg/flyte-core -n flyte -f https://raw.githubusercontent.com/flyteorg/flyte/master/charts/flyte-core/values-sandbox.yaml --wait