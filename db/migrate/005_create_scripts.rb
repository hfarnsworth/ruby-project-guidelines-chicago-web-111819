class CreateScripts < ActiveRecord::Migration[5.0]
    def change
        create_table :scripts do |t|
            t.string :name
            t.string :working_title
            t.integer :producer_id
            t.integer :draft_id # this should probably be deleted? 'script_id' already tracked in draft
            t.boolean :greenlit
        end
    end
end