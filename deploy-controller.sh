#!/bin/bash

INSTALLATION_NAME="arc-controller"
NAMESPACE="arc-systems"
helm upgrade --install "${INSTALLATION_NAME}" \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --values ./values.controller.yaml \
    --version 0.9.0 \
    oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller
