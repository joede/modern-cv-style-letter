#!/bin/sh
GS_OPT="-q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT -dMaxBitmap=500000000 -dAlignToPixels=0 -dGridFitTT=2 -sDEVICE=jpeg -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -r150"

pdflatex brief.tex
mv brief.pdf sample.pdf
gs $GS_OPT -sOutputFile=sample.jpg sample.pdf
convert -scale 500x sample.jpg texstudio/modern-cv-style-letter.png
rm -f sample.jpg brief.log brief.aux
zip  texstudio/modern-cv-style-letter.zip absender.lco brief.tex
