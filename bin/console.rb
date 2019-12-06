# This is for method calls



def welcome
    #clears terminal screen
    puts "\e[H\e[2J"
    banner = <<-HEREDOC
     _____                       _    _____                  _   
    / ____|                     | |  / ____|                | |  
   | (___   ___ _ __ _   _ _ __ | |_| |     _ __ _   _ _ __ | |_ 
    \\___ \\ / __| '__| | | | '_ \\| __| |    | '__| | | | '_ \\| __|
    ____) | (__| |  | |_| | |_) | |_| |____| |  | |_| | |_) | |_ 
   |_____/ \\___|_|   \\__, | .__/ \\__|\\_____|_|   \\__, | .__/ \\__|
                      __/ | |                     __/ | |        
                     |___/|_|                    |___/|_|             
    HEREDOC
    puts "    Welcome to"
    puts banner
    puts "                          ( Where scripts go to die! )"
end

def enter_username
    puts "Hello User, to get started, please enter your name."
    username = gets.chomp
end

def check_writer
    puts "We found you are a writer, would you like to see writer options? (y/n)"
    yes_no = gets.chomp.downcase
    if yes_no == 'y'
        return true
    elsif yes_no == 'n'
        return false
    else
        puts "sorry, but that isn't an option, run again."
        exit!
    end
end

def check_producer
    puts "We found you are a producer, would you like to see producer options? (y/n)"
    yes_no = gets.chomp.downcase
    if yes_no == 'y'
        return true
    elsif yes_no == 'n'
        return false
    else
        cut_program
    end
end

def neither_p_nor_w
    puts "Somehow, you are a User but haven't yet created a role for yourself"
    puts "Would you like to become a Producer or a Writer? (p = producer, w = writer)"
    gets.chomp.downcase
end

def cut_program
    puts "Sorry, but that isn't an option, run again to start over"
    exit!
end

def create_new
    puts "Would you like to create a new user? (p = Producer, w = Writer)"
    gets.chomp.downcase
end

def producer_menu(producer)
    puts "Hello #{producer.user.name}!  What would you like to do?"
    puts "here is a list of current scripts!"
end

def create_script(writer)
    puts "Hello #{writer.user.name}!  Would you like to create a new script? (y/n)"
    gets.chomp.downcase
end

def enter_project
    puts "You're ready to create a new script for our database!"
    puts "What would you like to name your new project?"
    gets.chomp
end

def enter_working_title
    puts "What is your current working title for your first draft?"
    gets.chomp
end

def enter_genre
    puts "What is the genre of your new screenplay?"
    gets.chomp
end

def enter_description
    puts "How would you describe this script for potential buyers?"
    gets.chomp
end

def enter_price
    puts "How much are you looking to sell your script for?"
    gets.chomp
end

def script_created
    puts "Your script has been created, and added to the database!"
    puts "If you would like to do more please run the app again."
    exit!
end