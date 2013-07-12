class CreateProducersOwnerIdIndex < ActiveRecord::Migration
  def up
    add_index(:producers, :owner_id, { name: "producers_owner_id_index" })
  end

  def down
    remove_index(:producers, name: "producers_owner_id_index")
  end
end
