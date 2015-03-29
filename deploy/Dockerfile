FROM conjurdemos/chefconf15-foundation

WORKDIR /

ENV LC_CTYPE=en_US.UTF-8

ADD conjurers  /etc/sudoers.d/conjurers
ADD .conjurenv /.conjurenv
ADD upload-all /usr/local/bin/upload-all
ADD list-all   /usr/local/bin/list-all
ADD knife.rb   /etc/chef/knife.rb
