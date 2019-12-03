class User < ActiveRecord::Base
    has_many :writers
    has_many :producers
end