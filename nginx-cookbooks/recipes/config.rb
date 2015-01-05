#
# Cookbook Name:: nginx
# Recipe:: config
#
# Copyright (C) 2014 Yotpo
#
# All right, reserved!
#

Chef::Log.info("NGINX: Configuring default params")

template 'nginx.conf' do
  path   "#{node[:nginx][:dir]}/nginx.conf"
  source 'nginx.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

template "yotpo.conf" do
  path "#{node[:nginx][:dir]}/conf.d/yotpo.conf"
  source "yotpo.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[nginx]"
end

directory "#{node['nginx']['dir']}/sites-available/" do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode "0755"
  action :create
end

directory "#{node['nginx']['dir']}/sites-enabled/" do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode "0755"
  action :create
end

file "#{node['nginx']['dir']}/conf.d/default.conf" do
	action :delete
end

file "#{node['nginx']['dir']}/conf.d/example_ssl.conf" do
  action :delete
end

logrotate_app "nginx" do
  path          "#{node['nginx']['log_dir']}/*.log"
  options       ['missingok', 'compress', 'delaycompress', 'notifempty', 'dateext']
  sharedscripts true
  postrotate    "[ -f #{node['nginx']['pid']} ] && kill -USR1 `cat /var/run/nginx.pid`"
  frequency     'daily'
  rotate        52
  create        '644 www-data www-data'
end
