#
# Cookbook Name:: nginx
# Recipe:: service
#
# Copyright (C) 2014 Yotpo
#
# All right, reserved!
#

Chef::Log.info("NGINX: Configuring service")


service "nginx" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end
