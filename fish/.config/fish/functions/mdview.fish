# View a markdown file in a browser.
function mdview
  set filename "$TMPDIR(basename $argv).html"
  $MARKDOWN $argv > $filename
  $BROWSER $filename
end
