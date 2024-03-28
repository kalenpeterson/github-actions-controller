#!/bin/bash

INSTALLATION_NAME="arc-runner-set2"
NAMESPACE="arc-runners2"
GITHUB_CONFIG_URL="https://github.com/kalenlab"
GITHUB_PAT=$(cat ./pat.txt)
kubectl apply secret generic github-token \
   --namespace=$NAMESPACE \
   --from-literal=github_token=$GITHUB_PAT

helm upgrade --install "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --values ./values.runner.yaml \
    --set githubConfigUrl="${GITHUB_CONFIG_URL}" \
    --set githubConfigSecret=github-token \
    --version 0.9.0 \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set
