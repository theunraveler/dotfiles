# ==============================
# Configurations
# ==============================

Pry.config.editor = ENV['EDITOR']

if defined?(PryByebug)
  Pry.config.commands.alias_command 'c', 'continue'
  Pry.config.commands.alias_command 's', 'step'
  Pry.config.commands.alias_command 'n', 'next'
  Pry.config.commands.alias_command 'f', 'finish'
end

if RUBY_PLATFORM =~ /darwin/i # OSX only.
  Pry.config.commands.command 'pbcopy', 'Copy argument to the clipboard' do |str = nil|
    str ||= _pry_.last_result
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end
end

# ==============================
# Core Ext
# ==============================

class Object
  def interesting_methods
    case self.class
    when Class
      public_methods.sort - Object.public_methods
    when Module
      public_methods.sort - Module.public_methods
    else
      public_methods.sort - Object.new.public_methods
    end
  end
end
