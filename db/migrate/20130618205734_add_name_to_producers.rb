class AddNameToProducers < ActiveRecord::Migration
  def change
    add_column :producers, :name, :string, :null => false
  end
end
