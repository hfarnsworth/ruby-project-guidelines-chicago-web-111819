class Writer < ActiveRecord::Base
    belongs_to :user
    has_many :drafts
    has_many :scripts, through: :drafts
    has_many :producers, through: :scripts

    # creates new script, with project_name, working_title, genre, description and 
    # optionally price values defined($5000 dollar default script price) and then
    # create a draft(join_class) connecting Writer to the newly 
    # created Script Object through the Draft
    def new_script(project_name, working_title, genre, description, price = 5000)
        script_attrs = {
            project_name: project_name,
            working_title: working_title,
            producer_id: nil,
            greenlit: false,
            genre: genre,
            description: description,
            price: price
        }

        # Create the script
        self.scripts.create(script_attrs)
    end

    # Deletes a writer's script
    def self.delete_script(script)
        target_script = self.scripts.find(script.id)
        if target_script && target_script.drafts.writer_id
            target_script.delete(script.id)
            return "Script successfully deleted!"
        else
            return "Oops, you can't delete this script :("
        end
    end

    def written_scripts
        Script.display_scripts_for(self)
    end

end