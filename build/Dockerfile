FROM ubuntu:14.04.4

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && add-apt-repository -y ppa:webupd8team/java && \
 	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
        echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
	apt-get update && apt-get install -y --no-install-recommends \
        git \
        oracle-java8-installer && \
	rm -f /var/cache/oracle-jdk8-installer/jdk-8u74-linux-x64.tar.gz

WORKDIR /root/

RUN mkdir -p uaaconfig
COPY uaaconfig/* uaaconfig/

RUN mkdir -p tomcatconfig
COPY tomcatconfig/* tomcatconfig/

RUN mkdir -p scripts
ADD build.sh scripts/

VOLUME target
CMD ["scripts/build.sh", "/target"]
