


require "colorize"
require "colorized_string"

class Magic8ball
  attr_accessor :responses, :default_responses
  def initialize
    @default_responses = [
      "I hate you.",
      "Worst idea I've ever heard.",
      "Why would you even consider it.",
      "Clearly you like suffering.",
      "You picked a bad day to stop eating ham.", 
      "I don't know.  Maybe ask the dog.", 
      "Maybe it will turn out ok, don't get your hopes up though.",
      "Could be.",
      "Go for it, the worst that could happen is that you die.",
      "Nobody ever failed spectacularly if they didn't try.", 
      "No."
    ]

    @responses = @default_responses    
  end

  def get_response
    @last_response = @responses.count-1
    response = @responses[rand(0...@last_response)]
    puts "#{response.colorize(:red)}"
  end

  def add_response(input)
    is_duplicate = true
    responses.each do |r|
      if r = input
        is_duplicate = true
      end
    end

      if is_duplicate
        puts "Duplicate not added"
        sleep(3)
      else
        @responses << input
      end
  end

  def view_responses
    @responses.each do |i|
      puts i.colorize(:light_black)
    end
  end

  def restore_defaults
    @responses = @default_responses.clone
  end
end

#instantiate an 8 ball
@magic_8_ball = Magic8ball.new()

def main
  system "clear"
 #puts ColorizedString.modes
  puts "QUIT".colorize(:green) + " or" + " OPEN 8 BALL".colorize(:green) + " (voids your warranty!)\n\n\n"
  print "Please ask the all-knowing 8-Ball: ".colorize(:magenta).bold
  case gets.strip.downcase
  when "quit"
    system "clear"
    puts "Nobody walks away from a magic 8 ball and lives to tell about it...".colorize(:magenta)
    sleep(3)
    puts "Nobody.".colorize(:magenta).bold
    exit
  when "open 8 ball"
    system "clear"
    puts "You have voided the warranty.".colorize(:red).bold
    puts "\nWould you like to" + " VIEW".colorize(:green) +" or" + " ADD".colorize(:green) +" responses?"
    puts "You can also" +" RESTORE".colorize(:green) + " the default responses."
    case gets.strip.downcase
    when "view"
      system "clear"
      puts "The guts of your 8 ball are arrayed before you...\n".colorize(:red)
      @magic_8_ball.view_responses
      continue
    when "add"
      system "clear"
      puts "would you like to add a new response? [y/N]: "
      if gets.strip.downcase == "y"
        print "Enter a new response: "
        new_response = gets.strip
        puts "\n You entered: "+"#{new_response.colorize(:red)}"
        puts "Would you like to save this response? [y/N]"
        if gets.strip.downcase == "y"
          @magic_8_ball.add_response(new_response)
        end
      end
    when "restore"
      system "clear"
      print "Are you sure you wish to delete ALL of your custom responses? [y/N]: ".colorize(:red)
      if gets.strip.downcase == "y"
        @magic_8_ball.restore_defaults
        puts "Default responses restored!"
        sleep(3)
      end
    else
    end
  else
    system "clear"
    puts "The magic 8 ball smiles at you and says: "
    puts @magic_8_ball.get_response
    sleep(5)
  end
  
  main
end

# Pauses the program until user presses enter
def continue
  if gets == "\n"
    system "clear"
  end
end

### Call the main loop
main