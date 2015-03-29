log_level                :info
log_location             STDOUT
node_name                ENV['HOSTNAME']
validation_client_name   ENV['CLIENT_NAME']
validation_key           ENV['CLIENT_PEM']
chef_server_url          'https://api.opscode.com/organizations/chefconf15-conjur'
