# Zyre implementation in Java

## How to use in your project

Add the following to your Maven project's `pom.xml`:

    <!-- for the Zyre using jzmq -->
    <dependency>
      <groupId>org.zyre</groupId>
      <artifactId>zyre</artifactId>
      <version>0.1.0-SNAPSHOT</version>
    </dependency>

    <!-- for the Zyre using JeroMQ -->
    <dependency>
      <groupId>org.zyre</groupId>
      <artifactId>zyre-jeromq</artifactId>
      <version>0.1.1-SNAPSHOT</version>
    </dependency>

## Building Jyre

* Install jzmq for your platform
* You may need to make sure that there is a native library 
  path defined for your platform in the pom.xml's 
  <profiles> section
* run **mvn install**

## Building zyre-jeromq

To build the version of jyre that uses jeromq:

* run the script gen-zyre-jeromq.sh, this generates the 
  subdirectory zyre-jeromq, a pom.xml, and copies src
  files from the jyre project
* cd to zyre-jeromq
* run **mvn install**
  

