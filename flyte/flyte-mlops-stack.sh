#!/bin/bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install contour-release bitnami/contour

helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm install spark-operator-release spark-operator/spark-operator --namespace spark-operator --create-namespace

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard


helm repo add flyte https://flyteorg.github.io/flyte
helm install -n flyte -f sanbdox-values.yaml --create-namespace flyte flyte/flyte-core