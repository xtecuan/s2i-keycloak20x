#!/bin/bash

export CN=keycloak.xtesoft.com
export DNAME="CN=${CN}, OU=IT, O=Xtesoft, L=Santa Ana, ST=Santa Ana, C=SV"
export ALIAS=server
export OPENSHIFT_IP=192.168.60.241
export EXT="SAN=IP:${OPENSHIFT_IP},DNS:${CN},EMAIL:xtecuan@xtesoft.com"



