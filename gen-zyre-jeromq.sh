#!/bin/bash

echo "Generate ZYRE codes use JeroMQ"

TARGET="zyre-jeromq"
JZMQ_VERSION="3.1.0"
JEROMQ_VERSION="0.3.5-SNAPSHOT"

if [ ! -d $TARGET ]; then
    mkdir $TARGET
fi

sed -e '
s/<artifactId>zyre<\/artifactId>/<artifactId>zyre-jeromq<\/artifactId>/
s/<name>zyre<\/name>/<name>zyre-jeromq<\/name>/
/<dependency>/,/<\/depencency>/ {
    /<groupId>org.zeromq<\/groupId>/,/<version>${JZMQ_VERSION}<\/version>/ { 
        s/jzmq/jeromq/
        s/'"${JZMQ_VERSION}"'/'"${JEROMQ_VERSION}"'/
    }
}' pom.xml > $TARGET/pom.xml

for j in `find ./src -name "*.java"`; do
    BASE=${j:2}
    FILE=${j##.*/}
    BASE=$TARGET/${BASE%/$FILE}
    mkdir -p $BASE
    cat $j > $BASE/$FILE
done

echo "Done"
