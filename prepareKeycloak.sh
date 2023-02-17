#!/bin/bash

export KC_HEALTH_ENABLED=true
export KC_METRICS_ENABLED=true
export KC_FEATURES=token-exchange
export KC_DB=postgres
export KEYCLOAK_ADMIN=admin 
export KEYCLOAK_ADMIN_PASSWORD=Locator90210jrp5


kc.sh build --db=$KC_DB
kc.sh show-config