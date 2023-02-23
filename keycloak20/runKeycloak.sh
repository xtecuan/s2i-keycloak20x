#!/bin/bash

export KC_HEALTH_ENABLED=true
export KC_METRICS_ENABLED=true
export KC_FEATURES=token-exchange
export KC_DB=postgres
export KC_DB_URL=jdbc:postgresql://192.168.60.1/keycloakdb
export KC_DB_USERNAME=keycloakdb
export KC_DB_PASSWORD=Locator90210jrp5
export KC_HOSTNAME=192.168.60.241
export KC_HTTPS_PROTOCOLS=TLSv1.3,TLSv1.2
export KC_KEYSTORE=/home/xtecuan/Projects/keycloak20/conf/server.keystore
export KEYCLOAK_ADMIN=admin 
export KEYCLOAK_ADMIN_PASSWORD=Locator90210jrp5
export PROXY_ADDRESS_FORWARDING=true
export KEYCLOAK_FRONTEND_URL=https://$KC_HOSTNAME:8443/

echo "kc.sh start --optimized    --db-url-host $KC_DB_URL --db-username $KC_DB_USERNAME --db-password $KC_DB_PASSWORD --hostname-strict false --https-key-store-file $KC_KEYSTORE --hostname $KC_HOSTNAME" > run.sh
chmod a+x run.sh
exec ./run.sh
