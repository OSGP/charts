#!/bin/bash

# SPDX-FileCopyrightText: Contributors to the Charts project
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | grep '[cC]hart.yaml' | sed -e 's#/[Cc]hart.yaml##g')"
KUBECONFORM_VERSION="v0.4.12"
SCHEMA_LOCATION="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/"

# install kubeconform
curl --silent --show-error --fail --location --output /tmp/kubeconform.tar.gz https://github.com/yannh/kubeconform/releases/download/"${KUBECONFORM_VERSION}"/kubeconform-linux-amd64.tar.gz
tar -xf /tmp/kubeconform.tar.gz kubeconform

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  helm dependency build "${CHART_DIR}"
  helm template "${CHART_DIR}" | ./kubeconform -strict -ignore-missing-schemas -kubernetes-version "${KUBERNETES_VERSION#v}" -schema-location "${SCHEMA_LOCATION}" -verbose -summary
done
