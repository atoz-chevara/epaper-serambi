#!/bin/bash
#
# Serambi Indonesia ePaper Downloader
# URL: http://aceh.tribunnews.com/epaper/
# Hal. 1-28
# This script based kompas-today.sh
# Created by 2009, Sugeng Doyle
# Modified by 2010, Utian Ayuba
# Modified by 2016, Izharul Haq
# Homepage: https://github.com/atoz-chevara/epaper-serambi
# Work with Cygwin Shell (https://www.cygwin.com/) and Git Shell (https://git-scm.com/)

# Now, it's just download today's Serambi Indonesia ePaper .jpg direct link

# Today's Date
TGL=`date +%d-%b-%Y`
DIR=serambi

# Make a directory based on today's date
mkdir -p $DIR-$TGL

# Major URL
URL="https://s3-ap-southeast-1.amazonaws.com/tribun-3/epaper/aceh"

# Download first page
echo "Downloading first page of Serambi Indonesia ePaper date $TGL..."
#wget -nvc -P $TGL $URL"/01.jpg"
wget -vc -P $DIR-$TGL $URL"/01.jpg"

# Open first page using firefox
#echo "Opening first page using Mozilla Firefox..."
#firefox $DIR-$TGL"/01.jpg" &

# Input the numbers of page
echo -n "Please check the numbers of page on the first page and input here (ex. 28): "
read PAGE

# Download from second page
echo "Downloading Serambi Indonesia ePaper date $TGL from page #2 until page #$PAGE..."
CHAP=2

until [ $CHAP -gt $PAGE ]; do
 
  if [ ${#CHAP} == 1 ]; then
    CH="0"$CHAP
     else if [ ${#CHAP} == 2 ]; then
       CH=""$CHAP
        else CH=$CHAP
	 fi
	  fi

#	   wget -nvc -P $DIR-$TGL $URL"/"""$CH".jpg"
	   wget -vc -P $DIR-$TGL $URL"/"""$CH".jpg"
	    
	     let CHAP+=1
	     done

	     echo "Download completed. The Serambi Indonesia ePaper is save to $DIR-$TGL directory."

	     exit;
