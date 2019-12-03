class CreateProducers < ActiveRecord::Migration[5.2]
    create_table :producers do |t|
        t.integer :script_id
    end
end