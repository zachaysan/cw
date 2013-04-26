class AddNameToConsumer < ActiveRecord::Migration
  def change
    add_column :consumers, :name, :string, :null => false
  end
end
