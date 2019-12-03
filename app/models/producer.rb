class Producer < ActiveRecord::Base
    belongs_to :user
    has_many :scripts
end