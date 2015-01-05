#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (C) 2014 Yops
#
# All right, reserved!
#
include_recipe "nginx::add_repo"
include_recipe "nginx::install"
include_recipe "nginx::config"
include_recipe "nginx::service"