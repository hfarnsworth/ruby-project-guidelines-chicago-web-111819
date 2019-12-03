class Writer < ActiveRecord::Base
    belongs_to :user
    has_many :scripts
    has_many :producers, through: :scripts
end