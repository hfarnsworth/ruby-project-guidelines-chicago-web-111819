# This is for method calls


def clear_screen
    #the magical string down below clears the terminal screen
    puts "\e[H\e[2J"
end

def cs
    clear_screen
end

def welcome
    clear_screen
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

# def producer_menu(producer)
#     puts "Hello #{producer.user.name}!  What would you like to do?"
#     puts "here is a list of current scripts!"
# end

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

def try_again
    puts "Welp, you've run out of options then.  Have a good day!"
    exit!
end

def prod_menu_scripts(producer)
    puts "Hello, #{producer.user.name}! Welcome to the Producer menu, we see that you have some scripts,"
    puts "Would you like to look at your scripts? y/n" 
    gets.chomp.downcase
end

def shopping_menu
    puts "Ok well here are all the available scripts, waiting to be bought"
end

def choose_script
    puts "The list above are the scripts available to buy, please enter the"
    puts "number of the script you would like to see more info(no period) or choose 'q' to quit"
    input = gets.chomp 
    if input == 'q'
        successful_exit
    else
        input
    end
end

def buy_or_go_back
    puts "Would you like to buy this script? (y/n)"
    gets.chomp.downcase
end

def successful_exit
    puts "Thanks for using ScryptCrypt, run again to do more stuff."
    exit!
end

def prod_menu_shop
    puts "Welcome to the Producer menu."
    puts "You don't have any scripts yet, here is what is available"
end