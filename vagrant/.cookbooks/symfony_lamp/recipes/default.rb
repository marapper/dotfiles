node.set['apache']['user']  = "vagrant"
node.set['apache']['group'] = "vagrant"
#TODO ports from json
node.set['apache']['listen_ports'] = ["8010", "8015"]

node.set['mysql']['server_root_password'] = "root"
node.set['mysql']['server_debian_password'] = "root"
node.set['mysql']['server_repl_password'] = "root"
node.set['mysql']['port']                       = 3306

node.set['mysql']['bind_address'] = node[:app][:ip]
node.set['mysql']['allow_remote_root'] = "1";

node.set['jolicode-php']['fpm_dir']       = "/etc/php5/fpm"
node.set['jolicode-php']['fpm_pool_dir']  = "/etc/php5/fpm/pool.d"

include_recipe "apt"

#for fedora
#node.set['networking']['packages'] = %w[ iptables jwhois curl wget rsync nmap traceroute ethtool iproute iputils nc tcptraceroute tcputils tcpdump elinks ]

#for fedora
#include_recipe "yum"

#apt_repository "php54" do
#  uri "ppa:ondrej/php5-oldstable"
#  distribution node['lsb']['codename']
#  components ["main"]
#  keyserver "keyserver.ubuntu.com"
#  key "E5267A6C"
#end

execute "apt-get update" do
  command "apt-get update"
end

package "python-software-properties" do
  action [:install, :upgrade]
end

execute "apt-get update" do
  command "apt-get update"
end

package "php5" do
  action :remove
end

execute "add ppa:ondrej/php5-oldstable" do
  command "add-apt-repository ppa:ondrej/php5-oldstable -y"
end

execute "apt-get update" do
  command "apt-get update"
end

#execute "apt-get upgrade -y" do
#  command "apt-get upgrade -y"
#end

package "php5"

include_recipe "networking_basic"

include_recipe "git"

template "/home/vagrant/.bashrc" do
  source ".bashrc"
  owner "vagrant"
  group "root"
  mode 0644
end

template "/home/vagrant/.inputrc" do
  source ".inputrc"
  owner "vagrant"
  group "root"
  mode 0644
end

template "/home/vagrant/.netrc" do
  source ".netrc"
  owner "vagrant"
  group "root"
  mode 0644
end

template "/home/vagrant/.gitconfig" do
  source ".gitconfig"
  owner "vagrant"
  group "root"
  mode 0644
end

template "/home/vagrant/.gitmessage.txt" do
  source ".gitmessage.txt"
  owner "vagrant"
  group "root"
  mode 0644
end

ENV['LANGUAGE'] = ENV['LANG'] = ENV['LC_ALL'] = "ru_RU.UTF-8"

locale_content = <<-EOH
LANG="ru_RU.UTF-8"
LANGUAGE="ru_RU.UTF-8"
EOH

file "/etc/default/locale" do
  owner "root"
  group "root"
  content locale_content
  action :create
end

execute "sed -i 's/Uni2/CyrSlav/g' /etc/default/console-setup" do
  action :run
end

execute "sudo locale-gen ru" do
  action :run
end

# dont' miss locale
package "debconf"

execute "sudo dpkg-reconfigure locales" do
  action :run
end

execute "apt-get install memcached" do
  command "apt-get install memcached"
end


include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"

#include_recipe "jolicode-php::php"
#include_recipe "jolicode-php::composer"
#include_recipe "jolicode-php::ext-apc"
#include_recipe "jolicode-php::ext-curl"
#include_recipe "jolicode-php::ext-dom"

#include_recipe "jolicode-php::ext-gd"
#include_recipe "jolicode-php::ext-imagick"
#include_recipe "jolicode-php::ext-intl"
#include_recipe "jolicode-php::ext-mbstring"
#include_recipe "jolicode-php::ext-mcrypt"
#include_recipe "jolicode-php::ext-mysql"
#include_recipe "jolicode-php::ext-pdo"
#include_recipe "jolicode-php::ext-pgsql"
#include_recipe "jolicode-php::ext-posix"

#include_recipe "jolicode-php::ext-memcache"
#include_recipe "jolicode-php::ext-memcached"

#include_recipe "jolicode-php::ext-fpm"
#include_recipe "jolicode-php::ext-xdebug"

#include_recipe "phpunit"
#include_recipe "xdebug"

include_recipe "mysql::server"

package "npm"

#yum_package "nfs-kernel-server"
#yum_package "ghostscript"
#yum_package "git-core"
#yum_package "imagemagick"
#yum_package "memcached"
#yum_package "nodejs"
#yum_package "npm"
#yum_package "sqlite"
#yum_package "vim"
#yum_package "nano"

package "php-apc"
package "php-apc"
package "php5-cli"
package "php5-xsl"
package "php5-curl"
package "php5-gd"
package "php5-ldap"
package "php5-imagick"
package "php5-dev"
package "php5-intl"
package "php5-mcrypt"
package "php5-memcache"
package "php5-memcached"
package "php5-mysql"
package "php5-sqlite"
package "php5-tidy"
package "php5-xmlrpc"

#package "php5-pdo"

gem_package "sass"
gem_package "compass"

template "/etc/php5/apache2/conf.d/custom_conf.ini" do
  source "php.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables({
    :php_timezone => node[:app][:php_timezone]
  })
end

template "/etc/php5/cli/conf.d/custom_conf.ini" do
  source "php.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables({
    :php_timezone => node[:app][:php_timezone]
  })
end

file "/etc/php5/apache2/conf.d/upload_path.ini" do
  owner "root"
  group "root"
  content "upload_tmp_dir = /tmp/web-app"
  action :create
end

apache_site "000-default" do
  enable false
end

node[:app][:web_apps].each do |identifier, app|
  web_app identifier do
    port app[:server_port]
    server_name app[:server_name]
    docroot "/home/vagrant/www-clone/" + app[:guest_docroot]
    php_timezone app[:php_timezone]
    directory_options "+Indexes +FollowSymLinks"
    allow_override "All"
  end
end

group "vboxsf" do
  members 'vagrant'
  append true
end


#symfony things

# execute "git config gtt.git.enabled true" do
#   action :run
# end

# template "/home/vagrant/app/config/parameters.yml" do
#   source "parameters.yml"
#   owner "vagrant"
#   group "root"
#   mode 0644
# end

#execute "/home/vagrant/www/app/console core:install --env=dev --share /home/vagrant/parameters.yml" do
#  action :run
#end

# git "/vagrant/www/site-ru" do
#   destination "/vagrant/www/site-ru"
#   repository "https://git.alpari-ru.dom/apps/site-ru"
#   enable_submodules true
#   remote "origin"
#   reference "master"
#   action :sync
# end

# git "/vagrant/www/my-ru" do
#   destination "/vagrant/www/my-ru"
#   repository "https://git.alpari-ru.dom/apps/my-ru"
#   enable_submodules true
#   remote "origin"
#   reference "master"
#   action :sync
# end

execute "cp -rf /home/vagrant/www /home/vagrant/www-clone" do
   action :run
end
