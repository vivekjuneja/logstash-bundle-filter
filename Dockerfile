FROM logstash:2.3.4

RUN apt-get update && apt-get install -y git rubygems 
RUN cd /opt && git clone https://github.com/vivekjuneja/logstash-filter-sequence.git

COPY logstash-filter-sequence.gemspec /opt/logstash-filter-sequence

RUN cd /opt/logstash-filter-sequence && gem build logstash-filter-sequence.gemspec && cd /opt/logstash && bin/logstash-plugin install /opt/logstash-filter-sequence/logstash-filter-sequence-0.1.1.gem


