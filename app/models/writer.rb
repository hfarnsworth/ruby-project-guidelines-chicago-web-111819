class Writer < ActiveRecord::Base
    belongs_to :user
    has_many :drafts
    has_many :scripts, through: :drafts
    has_many :producers, through: :scripts
end