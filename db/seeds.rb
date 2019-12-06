
# ActiveRecord::Base.logger = Logger.new(STDOUT)

Draft.destroy_all
Producer.destroy_all
Script.destroy_all
User.destroy_all
Writer.destroy_all


# -- Users [ User(name) ]
writers, producers = [], []
for k in 1..10 do
    writers << User.create(name: Faker::Name.name)
end

# -- Writers [ Writer(user_id) ]
w = writers.map { |w| Writer.create(user_id: w.id) }

# -- Scripts [ Script(name, working_title, producer_id, greenlit) ]
w.each do |writer|

    attrs = {
        project_name: "#{writer.user.name}'s Project 1",
        working_title: Faker::Book.title,
        genre: Faker::Book.genre,
        description: Faker::Lorem.sentences,
        price: "#{Faker::Number.number(digits: 1)}0000".to_i
    }
    created_script = Script.create(attrs)
    Draft.create(script_id: created_script.id, writer_id: writer.id)

    attrs = {
        project_name: "#{writer.user.name}'s Project 2",
        working_title: Faker::Book.title,
        genre: Faker::Book.genre,
        description: Faker::Lorem.sentences,
        price: "#{Faker::Number.number(digits: 1)}0000".to_i
    }
    created_script = Script.create(attrs)
    Draft.create(script_id: created_script.id, writer_id: writer.id)

    attrs = {
        project_name: "#{writer.user.name}'s Project 3",
        working_title: Faker::Book.title,
        genre: Faker::Book.genre,
        description: Faker::Lorem.sentences,
        price: "#{Faker::Number.number(digits: 1)}0000".to_i
    }
    created_script = Script.create(attrs)
    Draft.create(script_id: created_script.id, writer_id: writer.id)
end


puts "\n\n***__| Manual Tests |__***"

puts "\n === Users (#{User.all.length}) ==="
User.all.each { |i| puts "#{i.id} : #{i.name}" }
puts

puts " === Writers (#{Writer.all.length}) === "
Writer.all.each { |i| puts "#{i.id} : #{i.user_id}" }
puts

puts " === Scripts (#{Script.all.length}) === "
Script.all.each { |i|
    st = "#{i.id} : sn -> #{i.project_name}, wt -> #{i.working_title}, pid -> #{i.producer_id}, gl -> #{i.greenlit}"
    puts st
}
puts

puts " === Drafts (#{Draft.all.length}) === "
Draft.all.each { |i| puts "#{i.id} : script => #{i.script_id}, writer => #{i.writer_id}" }
puts

