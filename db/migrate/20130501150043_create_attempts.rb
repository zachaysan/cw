class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :webhook_id, null: false
      t.boolean :success, null: false
      t.timestamps
    end
  end
end
