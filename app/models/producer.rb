class Producer < ActiveRecord::Base
    belongs_to :user
    has_many :scripts

    # takes script object and attaches self.id to producer_id value,
    # also switches greenlit value to 'true'
    def buy_script(script)
        target_script = Script.find(script.id)
        if target_script && (target_script.greenlit == false || target_script.greenlit == nil)
            target_script.update(producer_id: self.id, greenlit: true)
            return "Script successfully bought!"
        else
            return "Oops, you can't buy this script at this time :("
        end
    end

    # removes producer from script and sets greenlit value back to false
    def drop_script(script)
        target_script = Script.find(script.id)
        if target_script
            target_script.update(producer_id: nil, greenlit: false)
            return "Script successfully dropped!"
        else
            return "Oops, specified script not found!"
        end
    end

    def owned_scripts
        self.scripts.order(:project_name).each_with_index { |s, i|
            n = i + 1
            puts "#{n}. #{s.working_title}"
        }
    end

end