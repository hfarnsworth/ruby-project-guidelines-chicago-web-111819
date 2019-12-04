require_relative '../app/models/draft.rb'
require_relative '../app/models/producer.rb'
require_relative '../app/models/script.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/writer.rb'


# ActiveRecord::Base.logger = Logger.new(STDOUT)

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
puts " === Users === "
User.all.each { |i| puts "#{i.id} : #{i.name}" }

# -- Producers [ Producer(user_id) ]
5.times do
    ui = User.all.sample.id
    Producer.create(user_id: ui)
end
puts " === Producers === "
Producer.all.each { |i| puts "#{i.id} : #{i.user_id}" }

# -- Writers [ Writer(user_id) ]
5.times do
    u_i = User.all.sample.id
    Writer.create(user_id: u_i)
end
puts " === Writers === "
Writer.all.each { |i| puts "#{i.id} : #{i.user_id}" }


# TODO: should both the draft and script track each other bi-directionally?

# -- Drafts [ Draft(script_id?, writer_id) ]

# -- Scripts [ Script(name, working_title, producer_id, draft_id?, greenlit) ]

