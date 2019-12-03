class Script < ActiveRecord::Base
    has_many :drafts
    has_many :producers
    has_many :writers, through: :drafts
    has_many :users, through: :producers
    has_many :users, through: :writers
end