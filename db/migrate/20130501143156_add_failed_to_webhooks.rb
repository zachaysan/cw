class AddFailedToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :failed, :boolean, null: false
  end
end
