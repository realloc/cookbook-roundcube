# encoding: utf-8

{ "#{node['roundcube']['destination']}/roundcube/config/db.inc.php" => 'roundcube/db.inc.php.erb',
  "#{node['roundcube']['destination']}/roundcube/config/main.inc.php" =>
    'roundcube/main.inc.php.erb',
  "#{node['roundcube']['destination']}/roundcube/.htaccess" => 'roundcube/htaccess.erb'
}.each do |file, tpl|
  template file do
    source tpl
    mode '644'
  end
end
