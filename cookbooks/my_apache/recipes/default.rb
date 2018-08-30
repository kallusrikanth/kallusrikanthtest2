#
# Cookbook:: my_apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#
include_recipe 'java'
package %w(httpd curl)

service 'httpd' do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    content: node['content'],
    author: node['author']
  )
end
