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

# Server macros
alias server.start="apache.start && mysql.start"
alias server.stop="apache.stop && mysql.stop"

# Apache
alias apache.reload="sudo apachectl graceful"
alias apache.start="sudo apachectl start"
alias apache.stop="sudo apachectl graceful-stop"
alias apache.test="sudo apachectl configtest"

# DNS/Network
alias dns.clear="dscacheutil -flushcache"
alias ip="curl icanhazip.com"

# Databases
alias mysql.start="mysql.server start"
alias mysql.stop="mysql.server stop"
alias mongodb.start="mongod --config /usr/local/etc/mongod.conf --syslog --fork"

# Wrap the `brew` command to make it update our list of brews.
function brew() {
  /usr/local/bin/brew "$@"
  RET=$?
  cat /dev/null > ~/.Brewfile &&
    /usr/local/bin/brew tap | xargs -I '{}' echo "tap {}" >> ~/.Brewfile &&
    /usr/local/bin/brew leaves | xargs -I '{}' echo "install {}" >> ~/.Brewfile
  return $RET
}

# Rails
alias rails.start.webrick="bundle exec rails server -d"
alias rails.start="bundle exec rails server thin -d"
alias rails.stop="ps -ax | grep 'ruby script/rails' | grep -v grep | awk '{print $1}' | xargs kill -15"
alias rails.restart="rails.stop && rails.start"

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

# Convert markdown to PDF
function md2pdf() {
  markdown $1 > $1.html &&
  htmldoc --cont --bodyfont helvetica --textfont helvetica --headfootsize 8.0 --fontsize 10.0 --format pdf14 $1.html > $1.pdf &&
  rm $1.html
}
