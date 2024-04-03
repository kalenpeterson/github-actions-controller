#!/bin/bash
set -e

INSTALLATION_NAME="arc-runner-set3"
NAMESPACE="arc-runners3"
GITHUB_CONFIG_URL="https://github.com/kalenlab"
GITHUB_PAT=$(cat ./pat.txt)
kubectl apply -f ./app-secret.yaml \
   --namespace=$NAMESPACE

helm upgrade --install "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --values ./values.runner.yaml \
    --set githubConfigUrl="${GITHUB_CONFIG_URL}" \
    --set githubConfigSecret=github-app-secret \
    --version 0.9.0 \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
