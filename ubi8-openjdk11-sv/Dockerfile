# quay.io/xtecuan/ubi8-openjdk11-sv
FROM registry.access.redhat.com/ubi8/ubi

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Tadeo Rivera-Pineda <xtecuan@protonmail.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building JDK 11" \
      io.k8s.display-name="JDK11 s2i Builder" \
      io.openshift.expose-services="8443:https,8080:http" \
      io.openshift.tags="JDK11,Java, Java s2i"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y
RUN yum -y update && yum -y install nano unzip zip net-tools ca-certificates java-11-openjdk-headless
RUN yum -y install curl wget
RUN java -version
RUN cp /etc/localtime /etc/localtime.old
RUN rm -rfv /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/El_Salvador /etc/localtime

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

# TODO: Set the default CMD for the image
# CMD ["/usr/libexec/s2i/usage"]
