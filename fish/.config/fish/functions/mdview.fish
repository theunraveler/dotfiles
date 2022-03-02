function mdview -d 'View a markdown file in a browser' -a md_file
  set filename "$TMPDIR(basename $md_file).html"
  $MARKDOWN $md_file > $filename
  $BROWSER $filename
end
