class MakeChangesToScripts < ActiveRecord::Migration[5.0]
    def change
        change_table :scripts do |t|
            t.rename :name, :project_name
            t.string :genre
            t.string :description
            t.integer :price
        end
    end
end