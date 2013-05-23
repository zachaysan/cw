class RenameAccessTokenToAccessTokens < ActiveRecord::Migration
  def change
    rename_table :access_token, :access_tokens
  end
end
