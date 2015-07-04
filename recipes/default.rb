#
# Cookbook Name:: chef_cassandra_mesos
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# download cassandra mesos
remote_file '/tmp/cassandra-mesos.tgz' do
	source node[:cassandra_mesos][:download_url]
	action :create_if_missing
end

bash 'extract_module' do
  cwd ::File.dirname(node[:cassandra_mesos][:install_dir])
  code <<-EOH
    tar xzf /tmp/cassandra-mesos.tgz
EOH
  not_if { ::File.exists?(extract_path) }
end

# setting cassandra-mesos configuration
template "#{node['cassandra_mesos']['install_dir']}/cassandra-mesos-#{node['cassandra_mesos']['version']}/conf/mesos.yaml" do
  source 'mesos.yaml.erb'
  variables({
    :download_url => "#{node['cassandra_mesos']['download_url']}",
    :master => "#{node['cassandra_mesos']['master']}",
    :n_nodes => "#{node['cassandra_mesos']['n_nodes']}",
    :cpu_min => "#{node['cassandra_mesos']['cpu']['min']}",
    :mem_min => "#{node['cassandra_mesos']['mem']['min']}",
    :disk_min => "#{node['cassandra_mesos']['disk']['min']}"
  })
  mode '0755'
end