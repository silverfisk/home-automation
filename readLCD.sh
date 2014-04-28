#!/bin/bash
# This script is used to take a photo of my boiler temperature display.
#
# Snap an autofocus picture of the boiler temperature
# Crop out the display
# Rotate the picture so the display is aligned with OCR software
# Then fuzz away some pixels and read the digits
# the magic. Read the two display digits.


function usage()
{
cat << EOF
usage: $0 options

This script downloads a picture and tries to read an LCD through OCR

OPTIONS:
* = mandatory option

   -h      Show this message
*  -b      Background color. Change BG color to something with good contrast to the text color
*  -u      URL to fetch image from
*  -G      Geometry string. Example: 74x105+1358+398. See doc/README-readLCD.txt
*  -R      Degrees to rotate the picture
*  -f      Fuzz level (percent). Increase/decrease to make it easier to detect the characters
*  -c      Text color - what color the text have (see doc/README-readLCD.txt for how to do this in gimp)
*  -d      Number of digits to expect
EOF
}

while [ "$1" != "" ]; do
    case $1 in
         -h )
             usage
             exit 1
             ;;

         -b)
             shift
             BG="$1"
                 ;;
         -u)
             shift
             URL="$1"
                 ;;
         -G)
             shift
             GEOSTR="$1"
             ;;
         -R)
             shift
             DGR="$1"
             ;;
         -f)
             shift
             FUZZLVL="$1%"
             ;;
         -d)
             shift
             DIGITS="$1"
             ;;
     esac
     shift
done


DIR="/tmp/$$"
mkdir -p $DIR &&\
cd $DIR &&\
wget -O picture -q "$URL" &&\
convert picture -crop "$GEOSTR" picture1 &&\
convert -rotate $DGR picture1 picture2 &&\
#convert picture2 -fill white -fuzz 15% +opaque "#fe5483" picture3 &&\
convert picture2 -fill white -fuzz $FUZZLVL +opaque "#fe5483" picture3 &&\
ssocr -d $DIGITS -T --background=$BG make_mono ./picture3 &&\
rm -rf "$DIR" || (rm -rf "$DIR" ; exit 1)
