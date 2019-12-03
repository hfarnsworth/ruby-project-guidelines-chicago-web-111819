class CreateWriters < ActiveRecord::Migration[5.2]
    create_table :writers do |t|
        t.integer :script_id
    end
end