#!/bin/sh
# Copyright 2022 Cartesi Pte. Ltd.
#
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use
# this file except in compliance with the License. You may obtain a copy of the
# License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

echo '( ln -s $1 $(echo $1 | sed "s/\(.*\/lib\/\)\(lib.*.so\).*/\1\2/") ) || true;' > linklib.sh
find /mnt/dapp/3rdparty/geos -name "lib*.so*" -type f -exec sh linklib.sh {} \;

sed -i "s/load_dll('c')/load_dll('c',fallbacks=['libc.so','libc.so.6'])/" /mnt/dapp/.env/cross/lib/python3.10/site-packages/shapely/geos.py