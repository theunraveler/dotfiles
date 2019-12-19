# Overrides
alias cat="bat"
alias cp="cp -rv"
alias grep="grep --color=auto --exclude-dir=.git --exclude-dir=node_modules --exclude=tags"
alias ls="exa"
alias mkdir="mkdir -vp"
alias mv="mv -v"
alias rsync="noglob rsync -arxvz --rsh=ssh --progress --exclude-from=$HOME/.rsync/exclude"
alias rm="rm -rv"
alias vi="mvim"
alias vim="mvim"

# Shorties
alias _='sudo'
alias b="brew"
alias be="bundle exec"
alias d="drush"
alias el="elixir"
alias g="git"
alias k="kill -15"
alias l='exa -lh'
alias ll="exa -lahF"
alias o='open'
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

# Misc
alias rmtrailingwhitespace="find . -type f -exec sed -i 's/[[:space:]]*$//' {} \;"

# lulz
alias fucking="sudo"
function whothefuckisusingport() { lsof -i tcp:$*; }
function whatthefuckisusingthefile() { lsof | grep $1 }

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias scp='noglob scp'
alias sftp='noglob sftp'

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

# Wrap sbcl in rlwrap to fix cursor issues
# https://www.marktrapp.com/blog/2014/01/20/lisp-with-os-x-sublime-text/
alias sbcl="rlwrap sbcl"
