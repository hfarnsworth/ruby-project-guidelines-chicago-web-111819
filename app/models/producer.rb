class Producer < ActiveRecord::Base
    belongs_to :user
    has_many :scripts

    # Script.first.update(producer_id: p1.id)
    # Script.first.update(greenlit: true)
end