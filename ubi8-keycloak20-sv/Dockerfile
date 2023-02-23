# quay.io/xtecuan/ubi8-keycloak20-sv
FROM quay.io/xtecuan/ubi8-openjdk11-sv

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Tadeo Rivera-Pineda <xtecuan@protonmail.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0
ENV KEYCLOAK_VERSION 20.0.5
ENV INSTALL_DIR /opt/keycloak
ENV BASE_URL https://github.com/keycloak/keycloak/releases/download
ENV PATH "$PATH":"$INSTALL_DIR/bin"
ENV KC_HEALTH_ENABLED true
ENV KC_METRICS_ENABLED true
ENV KC_FEATURES token-exchange
ENV KC_DB postgres
ENV KEYCLOAK_ADMIN admin 
ENV KEYCLOAK_ADMIN_PASSWORD Locator90210jrp5
ENV KC_DB_URL jdbc:postgresql://192.168.60.1/keycloakdb
ENV KC_DB_USERNAME keycloakdb
ENV KC_DB_PASSWORD Locator90210jrp5
ENV KC_HOSTNAME 192.168.60.241
ENV KC_HTTPS_PROTOCOLS "TLSv1.3,TLSv1.2"
ENV KC_KEYSTORE "${INSTALL_DIR}/conf/server.keystore"
ENV PROXY_ADDRESS_FORWARDING true
ENV KEYCLOAK_FRONTEND_URL "https://${KC_HOSTNAME}:8443/"

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building Keycloak 20x" \
      io.k8s.display-name="Keycloak 20x s2i Builder" \
      io.openshift.expose-services="8443:https,8080:http" \
      io.openshift.tags="Keycloak,Quarkus,JWT,openid connect"

# TODO: Install required packages here:
USER root
COPY ./files/keycloak-${KEYCLOAK_VERSION}.tar.gz /opt
RUN cd /opt/ && tar -xvzf keycloak-${KEYCLOAK_VERSION}.tar.gz
RUN rm /opt/keycloak-${KEYCLOAK_VERSION}.tar.gz
RUN mv /opt/keycloak-${KEYCLOAK_VERSION} ${INSTALL_DIR}
COPY ./files/scripts/*.sh ${INSTALL_DIR}/bin
RUN chmod a+x ${INSTALL_DIR}/bin/*.sh
RUN generateKeystore.sh
COPY ./s2i/bin/ /usr/libexec/s2i
RUN chown -R 0 ${INSTALL_DIR} && chmod -R g=u ${INSTALL_DIR}
RUN chown -R 1001:0 ${INSTALL_DIR}
USER 1001
RUN kc.sh build --db=${KC_DB}
RUN kc.sh show-config

# TODO: Set the default port for applications built using this image
EXPOSE 8443
EXPOSE 8080

# TODO: Set the default CMD for the image
CMD kc.sh start --optimized  --db-url-host $KC_DB_URL --db-username $KC_DB_USERNAME --db-password $KC_DB_PASSWORD --hostname-strict false --https-key-store-file $KC_KEYSTORE --hostname $KC_HOSTNAME
