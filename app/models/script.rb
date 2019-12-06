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

    # creates a new draft, meant to be called by either Producer or Writer, 
    # new writer can be added here, through CLI I will either input a new writer, 
    # or find the old writer, when adding a new draft, also, through this method, 
    # should be able to update Script instance's working_title if provided
    def add_draft(writer, w_title = nil)
        self.drafts.create(script_id: self.id, writer_id: writer.id)

        # update script's working title if changed and/or provided
        if not_nil(w_title) && not_empty(w_title)
            self.update(working_title: w_title)
        end
    end

    # finds all scripts which match the genre search term
    # (if possible, return genre matches by first 3 letters if exact match not found)
    def self.genre_search(searched_genre)
        genre_ci = searched_genre.downcase
        self.where("lower(genre) = ? OR lower(substr(genre, 1, 3)) = ?", genre_ci, genre_ci[0..3])
    end

    def self.display_scripts
        self.buyable_scripts.order(:project_name).each_with_index { |s, i|
            n = i + 1
            puts "#{n}. #{s.working_title}"
        }
    end

    def self.display_scripts_for(owner)
        owner.scripts.order(:project_name).each_with_index { |s, i|
            n = i + 1
            puts "#{n}. #{s.working_title}"
        }
    end

    # makes a nice puts string out of project_name, working_title, 
    # description, genre, drafts and price values for use in the CLI
    def pitch
        pitch_str = <<-PITCH
            Project name: #{self.project_name}
            Working title: #{self.working_title}
            Genre: #{self.genre}
            Price: #{self.price}
            Draft no: #{draft_count}
            Description:
            #{self.description}
        PITCH

        pitch_str
    end

    def draft_count
        self.drafts.length
    end

    # === helper methods ===
    def not_nil(arg)
        return !arg.nil?
    end

    def not_empty(arg)
        return !arg.to_s.strip.empty?
    end

end