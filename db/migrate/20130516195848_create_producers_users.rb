class CreateProducersUsers < ActiveRecord::Migration
  def change
    create_table :producers_users do |t|
      t.integer :user_id
      t.integer :producer_id
    end
  end
end
