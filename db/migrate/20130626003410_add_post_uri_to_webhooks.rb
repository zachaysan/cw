class AddPostUriToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :post_uri, :string, null: false
  end
end
