include_recipe 'anchorcms::mysql_server'
include_recipe 'php-fpm'

application 'anchorcms' do
  path node['anchorcms']['app_root']
  repository 'https://github.com/anchorcms/anchor-cms.git'
  revision 'master'
  owner 'www-data'
  group'www-data'
  packages ['php5-curl','php5-mcrypt','php5-gd','php5-mysql']


  nginx_load_balancer do
    only_if { node['roles'].include?('my-app_load_balancer') }
    set_host_header true
    application_port 9000
  end
end
