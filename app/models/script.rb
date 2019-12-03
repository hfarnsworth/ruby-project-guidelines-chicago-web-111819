class Script < ActiveRecord::Base
    has_many :writers
    has_many :producers
    has_many :users, through: :writers
    has_many :users, through: :producers
end