class User < ActiveRecord::Base
    has_one :writer
    has_one :producer
    has_many :scripts, through: :writers
end