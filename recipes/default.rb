include_recipe 'anchorcms::mysql_server'
include_recipe 'anchorcms::service'

application 'anchorcms' do
  path node['anchorcms']['app_root']
  repository 'https://github.com/anchorcms/anchor-cms.git'
  revision 'master'
  owner node['anchorcms']['deploy_user']
  group node['anchorcms']['deploy_group']
  packages ['git','php5-cli','php5-curl','php5-mcrypt','php5-gd','php5-mysql']
end

template '/etc/init/anchorcms.conf' do
  source 'anchorcms.upstart.conf.erb'
  owner 'root'
  group 'root'
  notifies :start, 'service[anchorcms]', :immediately
end
