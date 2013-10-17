#!/bin/sh

SRC_DIR=src
CLASSPATH=.:lib/hamcrest-core-1.3.jar:lib/junit-4.11.jar
JAR_NAME="HelloWorld.jar"

CLASS_FILES=`find src -name *.class`
for i in $CLASS_FILES ; do
  echo "cleaning $i" 
  rm $i
done

if [ -f $JAR_NAME ] ; then
  echo "cleaning $JAR_NAME"
  rm $JAR_NAME
fi

echo "compiling..."
javac -cp $CLASSPATH $SRC_DIR/com/test/*.java

if [ $? -eq 0 ] ; then
   echo "Compile successuful. Creating jar..."
   jar cvf $JAR_NAME -C $SRC_DIR .
   if [ $? -eq 0 ] ; then
     echo "jar creation successful!"
   else
     echo "jar creation failed!"
     exit 1
   fi
else
  echo "Compile failed!"
  exit 1
fi
