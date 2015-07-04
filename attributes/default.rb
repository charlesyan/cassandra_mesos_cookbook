# cassandra-mesos attributes
default[:cassandra_mesos][:version] = '2.0.5-1'
default[:cassandra_mesos][:download_url] = 'http://downloads.mesosphere.com/cassandra/cassandra-mesos-2.0.5-1.tgz'
default[:cassandra_mesos][:install_dir] = '/opt'
default[:cassandra_mesos][:master] = 'zk://localhost:2181/mesos'
default[:cassandra_mesos][:n_nodes] = 1

default[:cassandra_mesos][:cpu][:min] = 0.1
default[:cassandra_mesos][:mem][:min] = 512			# in MB
default[:cassandra_mesos][:disk][:min] = 1000		# in MB
