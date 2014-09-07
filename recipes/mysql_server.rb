include_recipe 'mysql::server'

mysql_database node['anchorcms']['database_name'] do
  connection(
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
  )
  action :create
end
