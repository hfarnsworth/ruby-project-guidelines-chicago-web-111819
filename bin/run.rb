require_relative '../config/environment'
require_relative 'console.rb'


welcome
username = enter_username
writer = nil
producer = nil

if User.get_user(username)
    user = User.get_user(username)
    puts "We found you!"
    if Writer.where(user_id: user.id).exists?
        write_true = check_writer
        if write_true
            writer = Writer.find_by(user_id: user.id)
            menu = 'writer'
        elsif !write_true
            puts "then you wanna be a producer too? (y/exit)"
            yes_or_no = gets.chomp
            if yes_or_no == 'y'
                producer = user.new_producer
                menu = 'producer'
            else
                try_again
            end
        end
    elsif Producer.where(user_id: user.id).exists?
        producer_true = check_producer
        if producer_true
            producer = Producer.find_by(user_id: user.id)
            menu = 'producer'
        elsif !producer_true
            puts "then you wanna be a writer too? (y/exit)"
            yes_or_no = gets.chomp
            if yes_or_no == 'y'
                writer = user.new_writer
                menu = 'writer'
            else
                try_again
            end
        end

    else
        p_or_w = neither_p_nor_w
        if p_or_w == 'p'
            producer = user.new_producer
            menu = 'producer'
        elsif p_or_w == 'w'
            writer = user.new_writer
            menu = 'writer'
        else
            cut_program
        end
    end
else
    p_or_w = create_new
    if p_or_w == 'p'
        user = User.create(name: username)
        producer = user.new_producer
        menu = 'producer'
    elsif p_or_w == 'w'
        user = User.create(name: username)
        writer = user.new_writer
        menu = 'writer'
    else
        cut_program
    end
end

clear_screen


if menu == 'producer'
    if !producer.scripts.empty?
        yes_or_no = prod_menu_scripts(producer)
            if yes_or_no == 'y'
                producer.owned_scripts
            elsif yes_or_no == 'n'
                clear_screen
                i = 0
                while i < 1 do
                    shopping_menu
                    Script.display_scripts
                    number = choose_script
                    number = number.to_i - 1
                    s_max = Script.display_scripts.size
                    if number < s_max && number >= 0
                        script = Script.buyable_scripts[number]
                        clear_screen
                        script.pitch
                        yn = buy_or_go_back 
                        if yn == 'y'
                            producer.buy_script(script)
                            successful_exit
                        else yn != 'n'
                            cut_program
                        end
                    else
                        cut_program
                    end
                end
            else 
                cut_program
            end
    else
        clear_screen
            i = 0
            while i < 1 do
                prod_menu_shop
                Script.display_scripts
                number = choose_script
                number = number.to_i - 1
                s_max = Script.display_scripts.size
                if number < s_max && number >= 0
                    script = Script.buyable_scripts[number]
                    clear_screen
                    script.pitch
                    yn = buy_or_go_back 
                    if yn == 'y'
                        producer.buy_script(script)
                        successful_exit
                    else yn != 'n'
                        cut_program
                    end
                else
                    cut_program
                end
            end
    end
elsif menu == 'writer'
    cs
    if !writer.scripts.empty?
        puts "Welcome to the Writer Menu."
        puts "We see that you have some scripts.  Would you like to see them? (y/n)"
        yes_or_no = gets.chomp
        if yes_or_no == 'y'
            writer.written_scripts
            successful_exit
        elsif yes_or_no == 'n'
            yn = create_script(writer)
            if yn == 'y'
                project_name = enter_project
                working_title = enter_working_title
                genre = enter_genre
                description = enter_description
                price = enter_price
                writer.new_script(project_name, working_title, genre, description, price)
                print writer.scripts.last.pitch
                script_created
                successful_exit
            elsif yn == 'n'
                try_again
            else
                cut_program
            end
        else
            cut_program
        end
    else
        yn = create_script(writer)
        if yn == 'y'
            project_name = enter_project
            working_title = enter_working_title
            genre = enter_genre
            description = enter_description
            price = enter_price
            writer.new_script(project_name, working_title, genre, description, price)
            print writer.scripts.last.pitch
            script_created
            successful_exit
        elsif yn == 'n'
            try_again
        else
            cut_program
        end
    end
else
    cut_program
end
