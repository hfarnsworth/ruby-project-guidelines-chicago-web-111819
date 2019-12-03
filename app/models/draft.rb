class Draft < ActiveRecord::Base
    belongs_to :writer
    belongs_to :script
end