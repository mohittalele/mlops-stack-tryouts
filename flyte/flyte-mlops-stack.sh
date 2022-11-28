#!/bin/bash
helm repo add flyteorg https://helm.flyte.org
helm install -n flyte flyte-deps flyteorg/flyte-deps --create-namespace -f https://raw.githubusercontent.com/flyteorg/flyte/master/charts/flyte-deps/values-sandbox.yaml
helm install flyte flyteorg/flyte-core -n flyte -f https://raw.githubusercontent.com/flyteorg/flyte/master/charts/flyte-core/values-sandbox.yaml --wait