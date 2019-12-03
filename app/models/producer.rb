class Producer < ActiveRecord::Base
    belongs_to :user
    has_many :scripts
    has_many :writers, through: :scripts
end