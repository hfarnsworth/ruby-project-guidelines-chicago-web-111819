class Script < ActiveRecord::Base
    has_many :drafts
    has_many :producers
    has_many :script_writers, class_name: "Writer", foreign_key: "draft_id"
    has_many :users, through: :producers
    has_many :users, through: :script_writers
end