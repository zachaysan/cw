class CreateWebhooks < ActiveRecord::Migration
  def up
    create_table :producers do |t|
      t.timestamps
    end

    create_table :consumers do |t|
      t.references :producer
      t.timestamps
    end

    create_table :webhooks do |t|
      t.text :data
      t.references :consumer
      t.timestamps
    end
  end

  def down
    drop_table :webhooks
    drop_table :consumers
    drop_table :producers
  end
end
