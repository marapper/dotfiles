#
# Cookbook Name:: postgresql
# Recipe:: server
#

include_recipe "postgresql"

service "postgresql" do
  case node['platform_family']
  when "rhel", "fedora", "suse"
    service_name "postgresql"
    # If restarted/reloaded too quickly httpd has a habit of failing.
    # This may happen with multiple recipes notifying apache to restart - like
    # during the initial bootstrap.
    restart_command "/sbin/service postgresql restart && sleep 1"
    reload_command "/sbin/service postgresql reload && sleep 1"
  when "debian"
    service_name "apache2"
    restart_command "/usr/sbin/invoke-rc.d postgresql restart && sleep 1"
    reload_command "/usr/sbin/invoke-rc.d postgresql reload && sleep 1"
  when "arch"
    service_name "postgresql"
  when "freebsd"
    service_name "postgresql"
  end
  supports [:restart, :reload, :status]
  action :enable
end

# install the package
package "postgresql-#{node["postgresql"]["version"]}"

# setup the data directory
include_recipe "postgresql::data_directory"

# add the configuration
include_recipe "postgresql::configuration"

# declare the system service
include_recipe "postgresql::service"

# setup users
include_recipe "postgresql::pg_user"

# setup databases
include_recipe "postgresql::pg_database"



