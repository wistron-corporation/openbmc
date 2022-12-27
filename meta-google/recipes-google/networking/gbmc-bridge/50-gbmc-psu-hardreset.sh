#!/bin/bash
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

[ -n "${gbmc_psu_hardreset-}" ] && return

gbmc_psu_hardreset_needed=

gbmc_psu_hardreset_hook() {
  # We don't always need a powercycle, allow skipping
  if [ -z "${gbmc_psu_hardreset_needed-}" ]; then
    echo "Skipping tray powercycle" >&2
    return 0
  fi

  echo "Powercycling" >&2
  systemctl start gbmc-psu-hardreset.target || return

  # Ensure that we don't continue the DHCP process while waiting for the
  # powercycle.
  exit 0
}

GBMC_BR_DHCP_HOOKS+=(gbmc_psu_hardreset_hook)

gbmc_psu_hardreset=1
