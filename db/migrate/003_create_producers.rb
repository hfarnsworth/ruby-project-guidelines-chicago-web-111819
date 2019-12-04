class CreateProducers < ActiveRecord::Migration[5.0]
    def change
        create_table :producers do |t|
            t.integer :user_id
        end
    end
end