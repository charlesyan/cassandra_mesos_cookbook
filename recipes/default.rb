#
# Cookbook Name:: chef_cassandra_mesos
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# download and extract cassandra-mesos
tar_extract node[:cassandra_mesos][:download_url] do
	target_dir "#{node['cassandra_mesos']['install_dir']}/cassandra-mesos-#{node['cassandra_mesos']['version']}"
	creates "#{node['cassandra_mesos']['install_dir']}/cassandra-mesos-#{node['cassandra_mesos']['version']}/bin/cassandra-mesos"
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