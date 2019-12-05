class Script < ActiveRecord::Base
    belongs_to :producer, optional: true
    has_many :drafts
    has_many :script_writers, through: :drafts, source: :writer
    has_many :users, through: :producers
    has_many :users, through: :script_writers

    # class method returns all scripts in database which aren't
    # greenlit/owned by a producer i.e. greenlit = false/nil
    def self.buyable_scripts
        self.where(:greenlit => [false, nil])
    end

end