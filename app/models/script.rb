class Script < ActiveRecord::Base
    belongs_to :producer
    has_many :drafts
    has_many :script_writers, through: :drafts, source: :writer
    has_many :users, through: :producers
    has_many :users, through: :script_writers
end