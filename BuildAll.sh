#!/bin/sh

# CLRadeonExtender
cd CLRadeonExtender/
echo Extracting CLRadeonExtender-*.zip...
7z x -y CLRadeonExtender-*.zip > /dev/null
cd CLRX-mirror-master/
mkdir build/
cd build/
cmake ../
make
cd ../../../

# Boost
cd BoostPackages/
echo Extracting boost_1_61_0.7z...
7z x -y boost_1_61_0.7z > /dev/null
cd boost_1_61_0
./bootstrap.sh 
# ./b2 link=static runtime-link=static -j 8 # FreeBSD is not happy.
./b2 link=static -j 8
cd ../../

mkdir CMakeBuild/
cd CMakeBuild/
cmake ../SourceFiles/
make
echo TEST/ >> patterns.txt
