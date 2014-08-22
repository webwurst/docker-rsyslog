from ubuntu:14.04
env DEBIAN_FRONTEND noninteractive

# locales
#env LC_ALL C.UTF-8

# helper
run apt-get update && apt-get install -y curl
# git vim less gzip bzip2 unzip byobu jq

# rsyslog
run echo "deb http://ppa.launchpad.net/adiscon/v8-stable/ubuntu trusty main" > /etc/apt/sources.list.d/rsyslog-v8-stable.list && \
  apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0x0f6dd8135234bf2b && \
  apt-get update && apt-get install -y rsyslog-elasticsearch

# conf
add 10-listen-remote.conf /etc/rsyslog.d/
add 80-elasticsearch.conf.env /etc/rsyslog.d/
add rsyslog_run /usr/local/bin/
add tmplenv /usr/local/bin/

cmd ["rsyslog_run"]
expose 514
