class CreateUsers < ActiveRecord::Migration[5.2]
    create_table :users do |t|
        t.string :name
        t.integer writer_id
        t.integer producer_id
    end
end