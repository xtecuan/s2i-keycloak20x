#!/bin/bash

export CN=qa.apis.authorization.apps.ocp01.promnet.com.sv
export DNAME="CN=${CN}, OU=IT, O=Banco Promerica, L=Antiguo Cuscatlan, ST=La Libertad, C=SV"
export ALIAS=server
export OPENSHIFT_IP=192.168.60.241
export EXT="SAN=IP:${OPENSHIFT_IP},DNS:${CN},EMAIL:jurivera@promerica.com.sv,EMAIL:gabriel.bran@promerica.com.sv"



