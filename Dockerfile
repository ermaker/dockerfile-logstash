FROM java
ENV LS_VERSION=1.4.2
RUN curl -sSL https://download.elasticsearch.org/logstash/logstash/logstash-${LS_VERSION}.tar.gz \
  | tar -xzf - -C /opt \
  && mv /opt/logstash-${LS_VERSION} /opt/logstash \
  && /opt/logstash/bin/plugin install contrib
CMD ["/opt/logstash/bin/logstash", "agent" ,"-f", "/opt/logstash/conf.d"]
