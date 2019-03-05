#!/bin/sh

# This script must be run as root, or root-priviledged user


export CXXFLAGS="-march=native -msse2"

set -e # if any of the commands fail the script will exit immediately

echo "*** Compiling ..."

cd mandelbulber2/qmake/
qmake mandelbulber-opencl.pro
make -j4

echo "*** Installing the program "

sudo install mandelbulber2 /usr/bin

echo "*** Creating links to files from formula and deploy folders in /usr/share/mandelbulber2 directory if you change anything in that folder you will not need to reinstall the program You have to remember to not delete mandelbulber2 folder located here"

MANDELBULBER_SHARE="/usr/share/mandelbulber2"

sudo rm -f -r $MANDELBULBER_SHARE
sudo mkdir $MANDELBULBER_SHARE
cd ..
sudo ln -s ${PWD}/formula $MANDELBULBER_SHARE/formula
sudo ln -s ${PWD}/data $MANDELBULBER_SHARE/data
sudo ln -s ${PWD}/language $MANDELBULBER_SHARE/language
sudo ln -s ${PWD}/deploy/share/mandelbulber2/materials $MANDELBULBER_SHARE/materials
sudo ln -s ${PWD}/deploy/share/mandelbulber2/examples $MANDELBULBER_SHARE/examples
sudo ln -s ${PWD}/deploy/share/mandelbulber2/icons $MANDELBULBER_SHARE/icons
sudo ln -s ${PWD}/deploy/share/mandelbulber2/textures $MANDELBULBER_SHARE/textures
sudo ln -s ${PWD}/deploy/share/mandelbulber2/toolbar $MANDELBULBER_SHARE/toolbar
sudo ln -s ${PWD}/deploy/share/mandelbulber2/doc $MANDELBULBER_SHARE/doc
sudo ln -s ${PWD}/deploy/share/mandelbulber2/sounds $MANDELBULBER_SHARE/sounds
sudo ln -s ${PWD}/opencl $MANDELBULBER_SHARE/opencl

echo "To run the program you need to launch folowing file:
mandelbulber2/mandelbulber2/qmake/mandelbulber2"
