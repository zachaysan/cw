class AddPostHeadersToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :post_headers, :text, :null => true
  end
end
