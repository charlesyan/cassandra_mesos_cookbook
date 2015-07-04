# chef_cassandra_mesos
chef cookbook to install and configure cassandra-mesos.

cassandra-mesos can be found at, https://github.com/mesosphere/cassandra-mesos

**DISCLAIMER**
_This is a very early preliminary version. This document, code behavior, and anything else may change without notice and/or break older installations._

To test, an associated vagrant repo, https://github.com/charlesyan/vagrant_cassandra_mesos.git is available.

#Pre-req
* mesos is assumed to be installed and functioning

#Current Status

###Implemented
* currently only settings in mesos.yaml are supported

Near Term Tasks
configurate cassandra through, 
* cassandra-env.sh
* cassandra-rackdc.properties
* cassandra-topology.properties
* cassandra-topology.yaml
* cassandra.yaml
* commit_archiving.properties
* log4j-server.properties
* log4j-tools.properties

More to come ...

