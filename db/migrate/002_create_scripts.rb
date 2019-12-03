class CreateScripts < ActiveRecord::Migration[5.0]
    def change
        create_table :scripts do |t|
            t.string :working_title
            t.integer :producer_id
            t.integer :draft_id
            t.boolean :greenlit
        end
    end
end