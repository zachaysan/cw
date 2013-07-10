class ChangeWebhooksColumnDataToPostData < ActiveRecord::Migration
  def change
    rename_column :webhooks, :data, :post_data
  end
end
