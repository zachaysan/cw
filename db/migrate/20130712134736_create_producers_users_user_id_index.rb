class CreateProducersUsersUserIdIndex < ActiveRecord::Migration
  def up
    add_index(:producers_users, :user_id, { name: "producers_users_user_id_index" })
  end

  def down
    remove_index(:producers_users, name: "producers_users_user_id_index")
  end
end
