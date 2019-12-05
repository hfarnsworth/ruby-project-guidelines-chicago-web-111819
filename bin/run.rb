require_relative '../config/environment'
require_relative 'console.rb'


welcome
username = enter_username

if User.get_user(username)
    user = get_user(username)
    puts "We found you!"
    if Writer.where(user_id: user.id).exists?
        write_true = check_writer
        if write_true
            writer = Writer.where(user_id: user.id)
            menu = 'writer'
        elsif !write_true
            puts "then you wanna be a producer too? (y/exit)"
            yes_or_no = gets.chomp
            if yes_or_no == 'y'
                producer = user.new_producer
                menu = 'producer'
            else
                cut_program
            end
        end
    elsif Producer.where(user_id: user.id).exists?
        producer_true = check_producer
        if producer_true
            producer = Producer.where(user_id: user.id)
            menu = 'producer'
        elsif !producer_true
            puts "then you wanna be a writer too? (y/exit)"
            yes_or_no = gets.chomp
            if yes_or_no == 'y'
                writer = user.new_writer
                menu = 'writer'
            else
                cut_program
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
    if create_new == 'p'
        user = User.create(name: username)
        producer = user.new_producer
        menu = 'producer'
    elsif create_new == 'w'
        user = User.create(name: username)
        writer = user.new_writer
        menu = 'writer'
    else
        cut_program
    end
end

if menu == 'producer'
    producer_menu
elsif menu == 'writer'
    writer_menu
else
    cut_program
end
