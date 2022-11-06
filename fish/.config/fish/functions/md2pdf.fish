function md2pdf -d 'Convert markdown to PDF' -a filename
  htmldoc \
    --cont \
    --bodyfont helvetica \
    --textfont helvetica \
    --headfootsize 8.0 \
    --fontsize 10.0 \
    --format pdf14 \
    --footer '...' \
    $filename > (path change-extension '' $filename).pdf
end
