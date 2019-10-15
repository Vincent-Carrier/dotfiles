# vim: ft=ruby

require "pry-byebug"
require "pry-doc"
require "pry-rescue"

Pry.config.color = true
Pry.config.prompt_name = File.basename(Dir.pwd)

Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"
Pry.config.commands.alias_command 'e', 'edit'
Pry.config.commands.alias_command 'ex', 'edit -ex'
Pry.config.commands.alias_command 'q', 'exit-program'
Pry.config.commands.alias_command 'resume', 'break --disable-all'
Pry.config.commands.alias_command 'rc', 'reload-code'

if defined?(PryByebug)
   def pry_debug
     Pry.commands.alias_command 's', 'step'
     Pry.commands.alias_command 'n', 'next'
     Pry.commands.alias_command 'c', 'continue'
     Pry.commands.alias_command 'f', 'finish'
     Pry.commands.alias_command 'u', 'up'
     Pry.commands.alias_command 'd', 'down'
     Pry.commands.alias_command 'b', 'break'
     Pry.commands.alias_command 'w', 'whereami'

     puts "Debugging Shortcuts"
     puts 'w  :  whereami'
     puts 's  :  step'
     puts 'n  :  next'
     puts 'c  :  continue'
     puts 'f  :  finish'
     puts 'Stack movement'
     puts 'ff :  frame'
     puts 'u  :  up'
     puts 'd  :  down'
     puts 'b  :  break'
     ""
   end

   # Longer shortcuts
   Pry.commands.alias_command 'ff', 'frame'

   Pry.commands.alias_command 'ss', 'step'
   Pry.commands.alias_command 'nn', 'next'
   Pry.commands.alias_command 'cc', 'continue'
   Pry.commands.alias_command 'fin', 'finish'
   Pry.commands.alias_command 'uu', 'up'
   Pry.commands.alias_command 'dd', 'down'
   Pry.commands.alias_command 'bb', 'break'
   Pry.commands.alias_command 'ww', 'whereami'
end

if defined?(::Rails) && Rails.env && Rails.env.test? && ENV["PRY_LONG"].blank?
  pry_debug
end

# begin
#   require 'awesome_print'
#   Pry.config.print = proc { |output, value| output.p value.ai }
#   AwesomePrint.pry!
# rescue LoadError => err
#   puts "no awesome_print :("
# end


# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

def more_help
  puts "Helpful shortcuts:"
  puts "hh  : hist -T 20       Last 20 commands"
  puts "hg : hist -T 20 -G    Up to 20 commands matching expression"
  puts "hG : hist -G          Commands matching expression ever used"
  puts "hr : hist -r          hist -r <command number> to run a command"
  puts

  puts "Samples variables"
  puts "a_array  :  [1, 2, 3, 4, 5, 6]"
  puts "a_hash   :  { hello: \"world\", free: \"of charge\" }"
  puts
  puts "helper   : Access Rails helpers"
  puts "app      : Access url_helpers"
  puts
  puts "require \"rails_helper\"              : To include Factory Girl Syntax"
  puts "include FactoryGirl::Syntax::Methods  : To include Factory Girl Syntax"
  puts
  puts "or if you defined one..."
  puts "require \"pry_helper\""
  puts
  puts "Sidekiq::Queue.new.clear              : To clear sidekiq"
  puts "Sidekiq.redis { |r| puts r.flushall } : Another clear of sidekiq"
  puts
  puts "Debugging Shortcuts"
  puts 'ss  :  step'
  puts 'nn  :  next'
  puts 'cc  :  continue'
  puts 'fin :  finish'
  puts 'uu  :  up'
  puts 'dd  :  down'
  puts 'bb  :  break'
  puts 'ww  :  whereami'
  puts 'ff  :  frame'
  puts '$   :  show whole method of context'
  puts
  puts "Run 'pry_debug' to display shorter debug shortcuts"
  ""
 end
 puts "Run 'more_help' to see tips"


 require 'byebug'
 class Byebug::WhereCommand
   def print_backtrace
      relevant_context = (0...context.stack_size).reject { |index| context.frame_file(index) =~ /(.gem\/ruby)|(.rubies\/ruby)/  }
      bt = prc('frame.line', relevant_context) do |index, _|
        Frame.new(context, index).to_hash
      end

      print(bt)
    end
  end
