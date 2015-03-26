FROM phusion/baseimage:0.9.16

RUN cd /tmp && \
  curl -o chefdk.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb && \
  dpkg -i chefdk.deb

ADD .conjurenv .conjurenv
ADD deploy.sh deploy.sh
ADD knife.rb knife.rb
