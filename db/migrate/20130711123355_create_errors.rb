class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.text :message
      t.timestamps
    end
  end
end
