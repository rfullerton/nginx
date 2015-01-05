#
# Cookbook Name:: nginx
# Recipe:: install
#
# Copyright (C) 2014 Yotpo
#
# All right, reserved!
#

Chef::Log.info("NGINX: Installing package")

package "nginx" do
	action :install
end
