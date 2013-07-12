class CreateProducersUsersProducerIdIndex < ActiveRecord::Migration
  def up
    add_index(:producers_users, :producer_id, { name: "producers_users_producer_id_index" })
  end

  def down
    remove_index(:producers_users, name: "producers_users_producer_id_index")
  end
end
