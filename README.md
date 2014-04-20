home-automation
===============


Using OCR to read displays
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

* Change your web cam url in readLCD.sh to download the photo of the display

* To figure out the cropping geometry for ImageMagick you need to use you need to edit readLCD.sh:
 - Open the downloaded web cam picture to your desktop and open it with Gimp.
 - Use 'Rectangle Select' tool and select your LCD display. Now you have the geometry. I fill in my values below so you know what is what
  - Position: 1357, 324
  - Size: 74, 105
 - See doc/gimp_screenshot1.png for a visual explanation of what I explained above

