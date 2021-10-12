IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000

# Use Pry everywhere
# source: https://github.com/lucapette/dotfiles/blob/master/irbrc
begin
  require 'rubygems'
  require 'pry'
  Pry.start
  exit
rescue LoadError; end
