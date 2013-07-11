class ChangeErrorsToPostErrors < ActiveRecord::Migration
  def change
    rename_table :errors, :post_errors
    rename_column :attempts, :error_id, :post_error_id
  end
end
