class CreateScripts < ActiveRecord::Migration[5.2]
    create_table :scripts do |t|
        t.string :working_title
        t.integer :draft
        t.integer :producer_id
        t.integer :writer_id
        t.boolean :greenlit
    end
end