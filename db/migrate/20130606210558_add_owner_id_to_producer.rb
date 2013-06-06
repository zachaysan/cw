class AddOwnerIdToProducer < ActiveRecord::Migration
  def change
    add_column :producers, :owner_id, :integer, :null => false
  end
end
