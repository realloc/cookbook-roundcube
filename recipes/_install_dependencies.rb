# encoding: utf-8

# We only run on RHEL family at the moment
case node['platform_family']
when 'rhel'
  include_recipe 'yum-epel'
else
  fail 'Cookbook only supports rhel platform family at the moment.'
end

# Include other cookbooks/recipes
include_recipe 'php::module_mysql'
include_recipe 'mysql-chef_gem::mysql2'
#include_recipe 'mysql::server'

# Additional packages not covered by php cookbook
%w( php-xml php-mcrypt php-mbstring php-intl ).each do |pkg|
  package pkg do
    notifies :restart, 'service[nginx]', :delayed
  end
end
