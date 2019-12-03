class AddWriterProducerToUser < ActiveRecord::Migration[5.0]
    def change
        add_column(:users, :writer_id, :integer)
        add_column(:users, :producer_id, :integer)
    end
end