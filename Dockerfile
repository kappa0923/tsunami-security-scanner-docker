FROM amazoncorretto:11
WORKDIR /root/tsunami
LABEL version="0.0.2"
LABEL author="kappa0923"

RUN yum update -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y nmap ncrack git glibc-locale-source glibc-langpack-ja
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TSUNAMI_VERSION 0.0.2

RUN /bin/bash -c "$(curl -sfL https://raw.githubusercontent.com/google/tsunami-security-scanner/master/quick_start.sh)"

# java -cp "tsunami-main-0.0.2-SNAPSHOT-cli.jar:/root/tsunami/plugins/*" -Dtsunami-config.location=/root/tsunami/tsunami.yaml com.google.tsunami.main.cli.TsunamiCli --ip-v4-target=192.168.1.7 --scan-results-local-output-format=JSON --scan-results-local-output-filename=/output/tsunami-output.json
CMD java -cp "tsunami-main-${TSUNAMI_VERSION}-SNAPSHOT-cli.jar:/root/tsunami/plugins/*" -Dtsunami-config.location=/root/tsunami/tsunami.yaml com.google.tsunami.main.cli.TsunamiCli --ip-v4-target=${SCAN_TARGET} --scan-results-local-output-format=JSON --scan-results-local-output-filename=/output/tsunami-output.json
