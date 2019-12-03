class CreateDrafts < ActiveRecord::Migration[5.0]
    def change
        create_table :drafts do |t|
            t.integer :script_id
            t.integer :writer_id
        end
    end
end