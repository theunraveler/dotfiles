# Convert markdown to PDF
function md2pdf
  $MARKDOWN $argv > $argv.html &&
  htmldoc --cont --bodyfont helvetica --textfont helvetica --headfootsize 8.0 --fontsize 10.0 --format pdf14 $argv.html > $argv.pdf &&
  rm $argv.html
end
