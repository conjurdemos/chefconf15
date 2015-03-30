FROM conjurdemos/chefconf15-foundation

RUN /opt/conjur/embedded/bin/gem install conjur-asset-audit-send --no-rdoc --no-ri
RUN echo "plugins: [ audit-send ]" >> /etc/conjur.conf

WORKDIR /

ADD conjurers  /etc/sudoers.d/conjurers
ADD .conjurenv /.conjurenv
ADD upload     /usr/local/bin/upload
ADD list-all   /usr/local/bin/list-all
ADD knife.rb   /etc/chef/knife.rb
