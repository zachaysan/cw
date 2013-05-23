class CreateAccessToken < ActiveRecord::Migration
  def change
    create_table :access_token do |t|
      t.integer :user_id 
      t.string :token
      t.timestamps
    end
  end
end
