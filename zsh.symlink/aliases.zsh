# Shell
alias cp="cp -rv"
alias grep="grep --color"
alias ls="ls --color=auto"
alias ll="ls -lh"
alias mkdir="mkdir -vp"
alias mv="mv -v"
alias rsync="rsync -arxvz --rsh=ssh --progress --exclude-from=$HOME/.rsync/exclude"
alias rm="rm -rv"
alias top="htop"

# Shorties
alias b="brew"
alias d="drush"
alias k="kill -15"
alias l="ls -lAh"

# DNS/Network
alias dns.clear="dscacheutil -flushcache"
alias ip="curl icanhazip.com"

# Homebrew
alias service="brew services"
alias start="brew services start"
alias stop="brew services stop"
alias restart="brew services restart"
function brew() {
  /usr/local/bin/brew "$@"
  RET=$?

  if \
    [ $RET -eq 0 ] &&
    { { [ $1 = 'tap' ] || [ $1 = 'untap' ] } && [ -n "$2" ] } || \
    [ $1 = 'install' ] || \
    { [ $1 = 'remove' ] || [ $1 = 'rm' ] } || \
    [ $1 = 'upgrade' ] \
  ; then
    echo -n 'Dumping Brewfile...'
    /usr/local/bin/brew bundle --global --force dump
    echo 'done.'
  fi

  return $RET
}

# SSH
alias ssh="ssh -A"

# SVN
alias svn.addall="svn status | grep '^\?' | awk '{print $2}' | xargs svn add"
alias svn.rmall="svn status | grep '^!' | awk '{print $2}' | xargs svn delete"
alias svn.reset="svn st -q | awk '{print $2}' | xargs svn revert"
alias svn.dryup="svn merge --dry-run -r BASE:HEAD ."
alias svn.authors="svn log -q | awk -F '|' '/^r/ {print \$2}' | sed 's/^ *//g' | sed 's/ *$//g' | sort -u"

# Vim
alias v="mvim"
alias vi="mvim"
alias vim="mvim"

# Misc
alias rmtrailingwhitespace="find . -type f -exec sed -i 's/[[:space:]]*$//' {} \;"
alias mail.vacuum="sqlite3 ~/Library/Mail/V2/MailData/Envelope\ Index vacuum"
alias launchservices.rebuild="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
alias issues="ghi"

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
