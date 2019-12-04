class User < ActiveRecord::Base
    has_one :writer
    has_one :producer
end