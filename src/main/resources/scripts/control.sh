#!/bin/bash
##
# Licensed to Cloudera, Inc. under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  Cloudera, Inc. licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

#command to start the haproxy process
set -e
ROLE=$1
CMD=$2

chmod +x $HAPROXY_LOC/haproxy
cp $HAPROXY_LOC/haproxy /usr/sbin/
cp $HAPROXY_LOC/libpcre.so.1.2.5 /usr/local/lib/


case ${CMD} in
  "start")
    echo "changing ${ROLE} status to started."
    # same approach as ZNCRYPT csd
    chmod u+x scripts/dummy-service.sh
    exec scripts/dummy-service.sh
    ;;
  "deploy")
    echo "config deploy of ${ROLE}."
    exit 0
    ;;
  *)
    echo "Unknown command ${CMD} for role ${ROLE}."
    exit 1
esac