class User < ActiveRecord::Base
    has_one :writer
    has_one :producer

    # accepts name argument in order to find Object for the entered argument returns nil if not found
    def self.get_user(user_name)
        self.find_by(name: user_name)
    end

    # acts on self to create new writer object linked to self.id
    def new_writer
        Writer.create(user_id: self.id)
    end

    # acts on self to create new producer object linked to self.id
    def new_producer
        Producer.create(user_id: self.id)
    end

end