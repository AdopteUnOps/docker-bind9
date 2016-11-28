FROM debian:jessie

RUN apt-get update -qq

RUN echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections &&\
    echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections

RUN apt-get install locales bind9 curl -qq

ENV LC_ALL en_US.UTF-8

ENV BIND9_IP ''
ENV BIND9_ROOTDOMAIN ''
ENV BIND9_KEYNAME ''
ENV BIND9_KEY ''
ENV BIND9_FORWARDERS '8.8.8.8;8.8.4.4;'
ENV BIND9_IPV4ONLY ''
ENV BIND9_ALSO_NOTIFY ''
ENV BIND9_SOA_SERIAL 20041125
ENV BIND9_SOA_REFRESH 604800 # 1 week
ENV BIND9_SOA_RETRY 86400 # 1 day
ENV BIND9_SOA_EXPIRE 2419200 # 4 weeks
ENV BIND9_SOA_NEGATIVE_TTL 604800 # 1 week


RUN apt-get clean

RUN mkdir -p /var/run/named /etc/bind/zones

RUN chmod 775 /var/run/named

RUN chown root:bind /var/run/named > /dev/nul 2>&1

ADD start.sh /usr/local/bin/

CMD ["/usr/local/bin/start.sh"]
