class AddAttemptToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :attempt, :boolean, null: false
  end
end
