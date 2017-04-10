#!/bin/bash

cd ../java

# compile java class
javac JniTest.java

# make header file JniTest.h
javah -jni JniTest

# make implementation of JniTest.h -> JniTest.cpp (already present)

# compile implementation of JniTest.h
g++ "-I/System/Library/Frameworks/JavaVM.framework/Versions/Current/Headers" -c JniTest.cpp

# package compiled cpp class into  jni library
g++ -dynamiclib -o ../resources/libJniTest.jnilib JniTest.o

# run the program
java -Djava.library.path=../resources JniTest

# remove classes
rm -rf *.class JniTest.h JniTest.o ../resources/libJniTest.jnilib