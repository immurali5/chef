#
# Cookbook:: .
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.


package node['package_name'] do
  action :install
end

service node['package_name'] do
  action :start
end
