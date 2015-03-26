FROM phusion/baseimage:0.9.16

RUN apt-get update

RUN cd /tmp && \
  curl -o chefdk.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb && \
  dpkg -i chefdk.deb

RUN cd /tmp && \
  curl -o conjur.deb https://s3.amazonaws.com/conjur-releases/omnibus/conjur_4.19.0-1_amd64.deb && \
  dpkg -i conjur.deb

RUN chef-solo -r https://github.com/conjurdemos/chefconf15-base/releases/download/v0.1.1/foundation-v0.1.1.tar.gz -o recipe[foundation]

ADD .conjurenv .conjurenv
ADD deploy.sh deploy.sh
ADD knife.rb knife.rb
