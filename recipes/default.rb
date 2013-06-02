#
# Cookbook Name:: kimkelen
# Recipe:: default
#
# Copyright (C) 2013 CeSPI - UNLP
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "kimkelen::_dependencies"
include_recipe "kimkelen::_database"
include_recipe "kimkelen::_deploy"
include_recipe "kimkelen::_web_server"

