#!/bin/sh

export CXXFLAGS="-march=native -msse2"

set -e # if any of the commands fail the script will exit immediately

# cd mandelbulber2/qmake/
# qmake mandelbulber-opencl.pro
# make -j4

# echo " installing the program "

# sudo install mandelbulber2 /usr/bin

echo "creating links to files from formula and deploy folders in /usr/share/mandelbulber2 directory if you change anything in that folder you will not need to reinstall the program You have to remember to not delete mandelbulber2 folder located here"

MANDELBULBER_SHARE="/usr/share/mandelbulber2"

sudo rm -f -r $MANDELBULBER_SHARE
sudo mkdir $MANDELBULBER_SHARE
sudo ln -s ${PWD}/mandelbulber2/formula $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/language $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/data $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/materials $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/examples $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/icons $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/textures $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/toolbar $MANDELBULBER_SHARE/
# sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/doc $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/deploy/share/mandelbulber2/sounds $MANDELBULBER_SHARE/
sudo ln -s ${PWD}/mandelbulber2/opencl $MANDELBULBER_SHARE/

echo "To run the program you need to launch folowing file:
mandelbulber2/qmake/mandelbulber2"
