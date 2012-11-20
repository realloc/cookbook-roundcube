#
# Cookbook Name:: roundcube
# Recipe:: _install_dependencies
#
# Copyright 2012, Sebastian Grewe
#
# All rights reserved - Do Not Redistribute
#

# We only run on RHEL family at the moment
case node['platform_family']
  when "rhel"
    include_recipe "yum::epel"
  else
    raise "Cookbook only supports rhel platform family at the moment."
end

# Include other cookbooks/recipes
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "php::module_mysql"
include_recipe "mysql::ruby"
include_recipe "mysql::server"

# Additional packages not covered by php cookbook
%w{php-xml php-mcrypt php-mbstring php-intl}.each do |pkg|
  package pkg do
    notifies :restart, "service[apache2]", :delayed
  end
end