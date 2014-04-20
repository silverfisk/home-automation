#!/bin/bash
# This script is used to take a photo of my boiler temperature display.
# To figure out the corpy geometry:
# - Open the downloaded picture to your desktop and open it with Gimp.
# - Use 'Rectangle Select' tool and select your LCD display. Now you have the geometry. I fill in my values below so you know what is what
#  - Position: 1357, 324
#  - Size: 74, 105
# - See doc/gimp_screenshot1.png for an explanation of what you're cropping

DIR="/tmp/$$"
mkdir -p $DIR
cd $DIR
wget -q http://192.168.1.85:8080/photoaf.jpg 					# Snap an autofocus picture of the boiler temperature
convert photoaf.jpg -crop 74x105+1357+324 photoaf1.jpg				# Crop out the display 
convert -rotate 86 photoaf1.jpg photoaf2.jpg					# Rotate the picture so the display is aligned with OCR software
convert photoaf2.jpg -fill white -fuzz 10% +opaque "#fe5483" photoaf3.jpg	# Fuzz away some pixels
ssocr -d 2 -T --background=white make_mono ./photoaf3.jpg			# Now to the magic. Read the two display digits
#rm -rf "$DIR"									# Clean up
