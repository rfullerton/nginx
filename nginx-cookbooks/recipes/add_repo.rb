#
# Cookbook Name:: nginx
# Recipe:: add_repo
#
# Copyright (C) 2014 Yotpo
#
# All right, reserved!
#

Chef::Log.info("NGINX: Adding Repo")

apt_repository 'nginx' do
  uri          'http://nginx.org/packages/mainline/ubuntu/'
  distribution node['lsb']['codename']
  components   ['nginx']
  key          'http://nginx.org/keys/nginx_signing.key'
end