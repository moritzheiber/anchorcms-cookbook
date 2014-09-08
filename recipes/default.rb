include_recipe 'anchorcms::mysql_server'
include_recipe 'php-fpm'

%w{mysql-client libmysqlclient-dev build-essential}.each do |pack|
  package pack do
    action :nothing
  end.run_action(:install)
end
chef_gem 'mysql' do
  action :nothing
end.run_action(:install)

application 'anchorcms' do
  path node['anchorcms']['app_root']
  repository 'https://github.com/anchorcms/anchor-cms.git'
  revision 'master'
  owner 'www-data'
  group 'www-data'
  packages ['git','php5-curl','php5-mcrypt','php5-gd','php5-mysql']

  php do
    write_settings_file false
  end

  nginx_load_balancer do
    hosts ['localhost']
    template 'nginx_php.conf.erb'
    application_port 9000
  end
end
