function md2pdf -d 'Convert markdown to PDF' -a filename
  $MARKDOWN $filename > $filename.html &&
  htmldoc --cont --bodyfont helvetica --textfont helvetica --headfootsize 8.0 --fontsize 10.0 --format pdf14 $filename.html > $filename.pdf &&
  rm $filename.html
end
