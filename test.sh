#!/bin/sh

CLASSPATH=.:HelloWorld.jar:lib/junit-4.11.jar:lib/hamcrest-core-1.3.jar

java -cp $CLASSPATH org.junit.runner.JUnitCore com.test.HelloWorldTest
