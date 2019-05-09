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
      "Nobody ever failed spectacularly if they didn't try."
    ]

    @responses = @default_responses    
  end

  def get_response
    @last_response = @responses.count-1
    response = @responses[rand(0...@last_response)]
    puts "#{response.colorize(:red)}"
  end

  def add_response(input)
    @responses << input
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
  #ColorizedString.color_samples
  puts "QUIT".colorize(:cyan) + " or" + " OPEN 8 BALL".colorize(:cyan) + " (voids your warranty!)\n\n\n"
  print "Please ask the all-knowing 8-Ball: ".colorize(:magenta)
  case gets.strip.downcase
  when "quit"
    system "clear"
    puts "Nobody walks away from a magic 8 ball and lives to tell about it..."
    sleep(3)
    exit
  when "open 8 ball"
    system "clear"
    puts "You have voided the warranty."
    puts "Would you like to" + " VIEW".colorize(:cyan) +" or" + " ADD".colorize(:cyan) +" responses?"
    puts "You can also" +" RESTORE".colorize(:cyan) + " the default responses."
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