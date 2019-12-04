require_relative '../app/models/draft.rb'
require_relative '../app/models/producer.rb'
require_relative '../app/models/script.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/writer.rb'


ActiveRecord::Base.logger = Logger.new(STDOUT)

Draft.destroy_all
Producer.destroy_all
Script.destroy_all
User.destroy_all
Writer.destroy_all


# -- Users [ User(name) ]
for k in 1..5 do
    n = "User #{k}"
    User.create(name: n)
end

# -- Producers [ Producer(user_id) ]
5.times do
    ui = User.all.sample.id
    Producer.create(user_id: ui)
end

# -- Writers [ Writer(user_id) ]
5.times do
    u_i = User.all.sample.id
    Writer.create(user_id: u_i)
end

# -- Scripts [ Script(name, working_title, producer_id, greenlit) ]
for idx in 1..8 do
    p_i = Producer.all.sample.id
    gl = (idx % 2 == 0) ? false : true
    attrs = {
        name: "Script #{idx}",
        working_title: "Working title #{idx}",
        producer_id: p_i,
        greenlit: gl
    }
    Script.create(attrs)
end

# -- Drafts [ Draft(script_id, writer_id) ]
10.times do
    s_i = Script.all.sample.id
    w_i = Writer.all.sample.id
    Draft.create(script_id: s_i, writer_id: w_i)
end


puts "\n\n***__| Manual Tests |__***"

puts "\n === Users (#{User.all.length}) ==="
User.all.each { |i| puts "#{i.id} : #{i.name}" }
puts

puts " === Producers (#{Producer.all.length}) === "
Producer.all.each { |i| puts "#{i.id} : #{i.user_id}" }
puts

puts " === Writers (#{Writer.all.length}) === "
Writer.all.each { |i| puts "#{i.id} : #{i.user_id}" }
puts

puts " === Scripts (#{Script.all.length}) === "
Script.all.each { |i|
    st = "#{i.id} : sn -> #{i.name}, wt -> #{i.working_title}, pid -> #{i.producer_id}, gl -> #{i.greenlit}"
    puts st
}
puts

puts " === Drafts (#{Draft.all.length}) === "
Draft.all.each { |i| puts "#{i.id} : script => #{i.script_id}, writer => #{i.writer_id}" }
puts

