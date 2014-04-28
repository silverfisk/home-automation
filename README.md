home-automation
===============


Using OCR to read displays with readLCD.sh
---------------------------

I'm using an old Android phone as a web cam with the free app "IP Webcam" to read the display of my boiler.
The software runs on an Raspberry Pi with debian, but any Linux version/architecture should work.

* Install Dependencies:
Imagemagick
 sudo apt-get install imagemagick
SSOCR
 wget http://www.unix-ag.uni-kl.de/~auerswal/ssocr/ssocr-2.16.0.tar.bz2
 tar xvjf ssocr-2.16.0.tar.bz2
 cd ssocr-2.16.0
 apt-get -y install libimlib2 libimlib2-dev
 make
 sudo make install

* Read in doc/README-readLCD.txt on how to set cropping, rotation and such.
