# Overrides
alias cp="cp -rv"
alias mkdir="mkdir -vp"
alias mv="mv -v"
alias rsync="rsync -arxvz --rsh=ssh --progress --exclude-from=$HOME/.rsync/exclude"
alias rm="rm -rv"
alias vi="mvim"
alias vim="mvim"

# Shorties
alias b="brew"
alias be="bundle exec"
alias d="drush"
alias el="elixir"
alias g="git"
alias k="kill -15"
alias py="python"
alias rb="ruby"
alias v="mvim"

# DNS/Network
alias dns.clear="dscacheutil -flushcache"
alias ip="curl icanhazip.com"

# Homebrew
alias service="brew services"
alias start="brew services start"
alias stop="brew services stop"
alias restart="brew services restart"
function brew() {
  $BREWPATH/bin/brew "$@"
  RET=$?

  if \
    [ $RET -eq 0 ] &&
    { { [ "$1" = 'tap' ] || [ "$1" = 'untap' ] } && [ -n "$2" ] } || \
    [ "$1" = 'install' ] || [ "$1" = 'reinstall' ] || \
    { [ "$1" = 'remove' ] || [ "$1" = 'rm' ] || [ "$1" = 'rmtree' ] } || \
    [ "$1" = 'upgrade' ] || \
    { [ "$1" = 'cask' ] && { [ "$2" = 'install' ] || [ "$2" = 'uninstall' ]  || [ "$2" = 'rm' ] } } \
  ; then
    echo -n 'Dumping Brewfile...'
    $BREWPATH/bin/brew bundle --global --force --no-restart dump
    echo 'done.'
  fi

  return $RET
}

# Misc
alias rmtrailingwhitespace="find . -type f -exec sed -i 's/[[:space:]]*$//' {} \;"
alias mail.vacuum="sqlite3 ~/Library/Mail/V2/MailData/Envelope\ Index vacuum"
alias launchservices.rebuild="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

# lulz
alias fucking="sudo"
function whothefuckisusingport() { lsof -i tcp:$*; }
function whatthefuckisusingthefile() { lsof | grep $1 }

# Convert markdown to PDF
function md2pdf() {
  $MARKDOWN $1 > $1.html &&
  htmldoc --cont --bodyfont helvetica --textfont helvetica --headfootsize 8.0 --fontsize 10.0 --format pdf14 $1.html > $1.pdf &&
  rm $1.html
}

# View a markdown file in a browser.
function mdview() {
  filename="$TMPDIR$(basename "$1").html"

  if [ -f "$filename" ]; then
    rm "$filename"
  fi

  $MARKDOWN $1 > $filename
  $BROWSER $filename
}

# Convert a QuickTime .mov file to a GIF
function mov2gif() {
  ffmpeg -i $1 -pix_fmt rgb24 -r 10 -f gif -
}

# Convenience function to execute some action on the argument (read: second
# column) part of STDIN.
#
# For example:
#
#     git status --porcelain | grep '??' | with_args rm
#
# You can reliably substitute this function anywhere you could do
# `awk '{print $2}' | xargs`.
function with_args() {
  awk '{print $2}' | xargs "$@"
}
