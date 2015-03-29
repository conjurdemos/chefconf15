FROM conjurdemos/chefconf15-foundation

WORKDIR /

ADD .conjurenv /.conjurenv
ADD client.rb   /etc/chef/client.rb

ADD chef-client.sh /etc/my_init.d/20_chef_client.sh
